# INFO133-Equipo14

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
- Ingresar al directorio `sql` para importar la estructura de la base de datos `sudo mysql -u USUARIO -p NOMBRE_DB < data.sql`.
- Una vez insertada la estructura de la base de datos, editar el archivo `config.py` con los respectivos datos de la base de datos.
- Con todo eso listo, sólo queda ejecutar el archivo `scripts/insert.py`