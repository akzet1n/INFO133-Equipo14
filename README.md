# INFO133-Equipo14

Parte A del proyecto de la asignatura INFO133 - Base de Datos

Profesor responsable: Matthieu Vernier

País: República Dominicana

# Integrantes

- Daniel Matamala
- Esteban Torres
- Roberto Videla

# Uso de la aplicación

- Clonar el repositorio `git clone https://github.com/akzet1n/INFO133-Equipo14`
- Acceder al directorio base `cd INFO133-Equipo14`
- Crear el ambiente virtual `python3 -m venv env`
- Activar el ambiente virtual `source env/bin/activate`
- Instalar los paquetes necesarios `pip3 install -r requirements.txt`
- Crear una base de datos en el servidor MySQL
- Importar la estructura de la base de datos `sudo mysql -u USUARIO -p NOMBRE_DB < sql/data.sql`
- Editar el archivo `config.py` con la información respectiva de la base de datos
- Ejecutar el script `scripts/insert.py`