package atomicidad;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author AllanRamiro
 */
public class ejercicio_1 {

    public static void main(String[] args) throws ParseException, SQLException {
        // TODO code application logic here

        int items = 1000000;
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
        String urlAgencia = "jdbc:mysql://localhost:3306/dbAgencia?useServerPrepStmts=false&rewriteBatchedStatements=true";
        String user = "root";//poner el usuario que tiene acceso a ambos host
        String pass = "root.8";  //poner la clave que tiene acceso a ambos host

        String dd = "";
        String mm = "";
        String yyyy = "2020";
        String fecha = "";
        String item_agencia = "";
        Date date = null;

        int dia = 1;
        int mes = 0;
        int nro_agencia = 1;
        double importe = 0;

        String arreglo[] = new String[items];
        for (int i = 0; i < items; i++) {

            dia = 1;
            mes = (int) (Math.random() * 11 + 0);
            nro_agencia = (int) (Math.random() * 140 + 1);
            item_agencia = "AGENCIA #" + String.valueOf(nro_agencia).trim();

            if (mes == 2) {
                dia = (int) (Math.random() * 28 + 1);
            } else {
                dia = (int) (Math.random() * 30 + 1);
            }

            dd = String.format("%02d", dia);
            mm = String.format("%02d", mes);

            date = formatter.parse(yyyy + "-" + mm.trim() + "-" + dd.trim());
            fecha = String.format("'%1$tY-%1$tm-%1$te'", date);

            importe = Math.round(Math.random() * (1000000 + 1000) * 100) / 100;
            arreglo[i] = "(" + fecha + ",'" + item_agencia + "'," + importe + ")";
        }

        try {
            Class.forName("com.mysql.jdbc.Driver");

            Connection cnAgencia;
            cnAgencia = DriverManager.getConnection(urlAgencia, user, pass);
            cnAgencia.setAutoCommit(false);
            Statement st = cnAgencia.createStatement();

            String ins = "INSERT INTO facturas(fecha_factura,  item_sucursal, imp_total_vta) VALUES";

            String data = String.format(" %s;", ins + String.join(", ", arreglo));

            System.out.println("Proceso Iniciado");
            st.executeUpdate(data);
            cnAgencia.setAutoCommit(true);
            System.out.println("Proceso finalizado");

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ejercicio_1.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
