# Atomicidad, Dabases de Datos Distribuidas

  Creado por: Allan Ramiro Flores Murillo.
  Nacionalidad: Hondureña.
  Proposito: Enseñanza

# Requisitos:
- Netbeans 12.2 
- Jdk 1.11 
- MySQL 5.7

# Scripts de base de datos
   
- dbAgencia.sql crea la base de datos de la agencia
- dbCentral.sql crea la base de datos de la oficina central.

# Metodos Pasivos de RowSet

- CachedRowSet	  Permite crear un cache de resultados de formas pasivas o desacoplada
- JdbcRowSet	  Permite crear consultas a base de datos
- JoinRowSet	  Permite crear relaciones entre resultados
- RowSetFactory	  Instancia una fábrica de RowSet
- WebRowSet	      Permite leer y escribir en un resultado XML
- FilterRowSet	  Permite el filtrado de resultado


# Algoritmo Fork-Join
  En este patrón de diseño se generan dos ejecuciones concurrentes, 
  que empieza inmediatamente después de que el fork es llamado en código,  
  después se usa join para combinar estas dos ejecuciones concurrentes en una.
  Cada join puede unirse entonces a su fork correspondiente y lo hace antes de las otras terminen.

  EL API JoinRowSet de Java proporciona la aplicación del algoritmo Fork-Join
  CON ESTE ALGORTIMO CREAREMOS UNA RELACION ENTRE LOS CACHE 
  PREVIAMENTE CARGADOS, NO ENTRE TABLAS, LAS TABLAS PUEDEN ESTAR EN "N" SERVIDOR
