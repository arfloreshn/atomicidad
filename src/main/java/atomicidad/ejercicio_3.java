package atomicidad;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.rowset.CachedRowSet;
import javax.sql.rowset.JoinRowSet;
import javax.sql.rowset.RowSetFactory;
import javax.sql.rowset.RowSetProvider;

/**
 *
 * @author AllanRamiro
 */
public class ejercicio_3 {

    public static void main(String[] args) throws ClassNotFoundException {

        try {

            Class.forName("com.mysql.jdbc.Driver");

            String urlAgencia = "jdbc:mysql://localhost:3306/dbAgencia";
            String urlCentral = "jdbc:mysql://localhost:3306/dbCentral?useServerPrepStmts=false&rewriteBatchedStatements=true";
            String user = "root"; //poner el usuario que tiene acceso a ambos host
            String pass = "root.8";  //poner la clave que tiene acceso a ambos host

            Connection cnAgencia;
            Connection cnCentral;

            cnAgencia = DriverManager.getConnection(urlAgencia, user, pass);
            cnCentral = DriverManager.getConnection(urlCentral, user, pass);

            Statement agencia = cnAgencia.createStatement();
            Statement OficinaCentral = cnCentral.createStatement();

            String consulta = "SELECT fecha_factura,  item_sucursal,imp_total_vta FROM facturas "
                    + "WHERE fecha_factura between '2020-04-01' and '2020-04-30'";

            ResultSet rsFacturas = agencia.executeQuery(consulta);
            ResultSet rsAgencias = OficinaCentral.executeQuery("SELECT agencia_id,desc_agencia FROM agencias");

            RowSetFactory factory = RowSetProvider.newFactory();
            CachedRowSet cacheAgencia = factory.createCachedRowSet();
            CachedRowSet cacheOficinaCentral = factory.createCachedRowSet();

            cacheAgencia.populate(rsFacturas);  //Instanciamos los cache del reporte o la data a importar
            cacheOficinaCentral.populate(rsAgencias);  //Instanciamos el cache de las sucursales

            /*--------------------------------------------- ALGORITMO FORK-JOIN ----------------------------------------------------------
                 Algoritmo Fork-Join
                 En este patrón de diseño se generan dos ejecuciones concurrentes, 
                 que empieza inmediatamente después de que el fork es llamado en código,  
                 después se usa join para combinar estas dos ejecuciones concurrentes en una.
                 Cada join puede unirse entonces a su fork correspondiente y lo hace antes de las otras terminen.
            
                 EL API JoinRowSet de Java proporciona la aplicación del algoritmo Fork-Join
                 CON ESTE ALGORTIMO CREAREMOS UNA RELACION ENTRE LOS CACHE 
                 PREVIAMENTE CARGADOS, NO ENTRE TABLAS, LAS TABLAS PUEDEN ESTAR EN "N" SERVIDOR
            
             ----------------------------------------------------------------------------------------------------------------------*/
            JoinRowSet jrs = factory.createJoinRowSet();    // Declaramos una variable de para relacionar los caches con data que cargamos previamente
            jrs.addRowSet(cacheAgencia, " item_sucursal");     // Establecemos los campos que vamos a relacion en este caso es "item_sucursal"
            jrs.addRowSet(cacheOficinaCentral, "desc_agencia");       // Establecemos los campos que vamos a relacion en este caso es "desc_agencia"


            /*-----------------------------------------------------------------------------------------------
              METODO 2, PreparedStatement - API JODBC JAVA 
             ------------------------------------------------------------------------------------------------*/
            //Desactivamos en autocommit lo vamos a confirmas hasta el final bloque
            cnCentral.setAutoCommit(false);
            PreparedStatement cmd_dos;
            cmd_dos = cnCentral.prepareStatement("INSERT INTO RESUMEN_FACTURAS(fecha,agencia_id,importe) VALUES (?, ?, ?)");

            int counter = 0;
            jrs.beforeFirst();
            System.out.println("Inicio del Bloque 2:" + new Date());
            while (jrs.next()) {

                cmd_dos.setString(1, jrs.getString("fecha_factura").substring(0, 10));
                cmd_dos.setInt(2, jrs.getInt("agencia_id"));
                cmd_dos.setDouble(3, jrs.getDouble("imp_total_vta"));
                cmd_dos.addBatch();
                counter++;

                //al tener 1000 registros, mandamos todas a ejecutar el insert 
                if (counter == 1000) {
                    cmd_dos.executeBatch();
                    counter = 0;
                }

            }

            //revisamos si todavía hay sentencias pendientes de ejecutar
            if (counter > 0) {
                cmd_dos.executeBatch();
            }

            cnCentral.setAutoCommit(true);
            System.out.println("Fin de la respuesta Bloque 2:" + new Date());

        } catch (SQLException ex) {
            Logger.getLogger(ejercicio_3.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
