import mysql.connector

# credenciales para la conexión
DB_HOST = "localhost"
DB_PORT = "3306"
DB_USER = "roberto"
DB_PASS = "123"
DB_NAME = "medios_de_prensa"

# intentando inicializar la conexión
try:
    db = mysql.connector.connect(user=DB_USER, password=DB_PASS, host=DB_HOST, database=DB_NAME, port=DB_PORT)
    cursor = db.cursor()
except:
    db = None
    cursor = None