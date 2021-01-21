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

# Transacciones de tipo ACID

Se dice que una transacción que cumple con todos estos requisitos es una transacción ACID (
el término familiar ACID es obtenido al combinar la primera letra de cada una de las cuatro propiedades).

No todas las transacciones son transacciones ACID, y aquellas que lo son a menudo ofrecen cierta flexibilidad 
en el cumplimiento de las propiedades ACID. 

Por ejemplo, el nivel de aislamiento es una configuración común que se puede configurar para proporcionar
grados de aislamiento más laxos o más estrictos que los descritos anteriormente. 

Por lo general, se realizan por razones de mayor rendimiento o, en el otro lado del espectro, si una aplicación tiene 
una consistencia de datos más estricta requisitos. 

Las transacciones que discutimos en el contexto de Java EE son normalmente de la variedad ACID.

- Atomicidad: O todas las operaciones de una transacción son exitosas o ninguna de ellas. los
El éxito de cada operación individual está ligado al éxito de todo el grupo.

- Consistencia: el estado resultante al final de la transacción se adhiere a un conjunto de reglas que
definir la aceptabilidad de los datos. Los datos en todo el sistema son legales o válidos con respecto a
el resto de los datos del sistema.

- Aislamiento: los cambios realizados dentro de una transacción son visibles solo para la transacción que está realizando
los cambios. Una vez que una transacción confirma los cambios, son visibles atómicamente para otros
actas.

- Durabilidad: los cambios realizados dentro de una transacción perduran más allá de la finalización del
transacción.