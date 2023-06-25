import sys
import utils.helpers
import utils.exceptions
import utils.queries
from config import db, cursor

# Obtener la información para la tabla `medios`
def get_medios_info() -> str:
    nombre = str(input("Ingresa el nombre del medio de prensa: "))
    if not utils.helpers.check_empty(nombre):
        raise utils.exceptions.EmptyError
    año = utils.helpers.sanitize_year(str(input("Ingresa el año de fundación del medio de prensa (vacío en caso de no saberlo): ")))
    url = str(input("Ingresa el sitio web del medio de prensa: "))
    if not utils.helpers.check_empty(url):
        raise utils.exceptions.EmptyError
    return nombre, año, url

# Obtener la información para la tabla `ubicaciones`
def get_ubicaciones_info() -> str:
    ciudad = str(input("Ingresa el nombre de la ciudad: "))
    if not utils.helpers.check_empty(ciudad):
        raise utils.exceptions.EmptyError
    pais = str(input("Ingresa el nombre del pais: "))
    if not utils.helpers.check_empty(pais):
        raise utils.exceptions.EmptyError
    region = str(input("Ingresa el nombre de la región: "))
    if not utils.helpers.check_empty(region):
        raise utils.exceptions.EmptyError
    continente = str(input("Ingresa el nombre del continente: "))
    if not utils.helpers.check_empty(continente):
        raise utils.exceptions.EmptyError
    return ciudad, pais, region, continente

# Ingresar la información en la tabla `medios` y `ubicaciones`
def insert_medios_ubicaciones_info(nombre: str, año: str, url: str) -> int:
    # Checkeando si el nombre del medio ya existe
    cursor.execute(utils.queries.CHECK_EXISTING_NAME % nombre)
    res_1 = cursor.fetchone()
    # Checkeando si la URL del medio ya existe
    cursor.execute(utils.queries.CHECK_EXISTING_URL % url)
    res_2 = cursor.fetchone()
    # Si el medio y la URL no están ingresadas
    if res_1 is None and res_2 is None:
        # Preguntamos si es que el medio de prensa tiene ubicación
        ubi = int(input("Existe una ubicación para el medio de prensa? (0 no, 1 si): "))
        # Si el medio de prensa tiene ubicación
        if ubi:
            # Obtenemos la información de la ubicación del medio
            ciudad, pais, region, continente = get_ubicaciones_info()
            # Checkeamos si la ubicación ya existe
            cursor.execute(utils.queries.CHECK_EXISTING_LOC % (ciudad, pais, region, continente))
            res = cursor.fetchone()
            # Si la ubicación no existe, la creamos
            if res is None:
                cursor.execute(utils.queries.INSERT_LOCATION % (ciudad, pais, region, continente))
            # Si la ubicación no existe utilizamos de la ubicación recién ingresada
            # Si ya existe, utilizamos la obtenida en la línea 60
            ubi_id = cursor.lastrowid if res is None else res[0]
            # Si tenemos un año vacío
            if año is None:
                cursor.execute(utils.queries.INSERT_MEDIA_OUTLET_WY % (nombre, ubi_id, url))
            # Si tenemos un año válido
            else:
                cursor.execute(utils.queries.INSERT_MEDIA_OUTLET % (nombre, ubi_id, año, url))
        # Si el medio de prensa no tiene ubicación
        else:
            # Si tenemos un año vacío
            if año is None:
                cursor.execute(utils.queries.INSERT_MEDIA_OUTLET_WU_WY % (nombre, url))
            # Si tenemos un año válido
            else:
                cursor.execute(utils.queries.INSERT_MEDIA_OUTLET_WU % (nombre, año, url))
        # Retornamos el id único del medio de prensa ya ingresado
        return cursor.lastrowid
    # Si la combinación del nombre y URL está ingresada, devolvemos un error
    if res_1 is not None and res_2 is not None:
        raise utils.exceptions.MediaError
    # Si el nombre del medio está ingresado, devolvemos un error
    if res_1 is not None:
        raise utils.exceptions.MediaNameError
    # Si la URL del medio está ingresada, devolvemos un error
    if res_2 is not None:
        raise utils.exceptions.MediaURLError

# Obtener la informacion para la tabla `coberturasMedios`
def get_coberturas_info() -> list:
    print("Las coberturas disponibles para los medios de prensa son:")
    print("(1) Local - (2) Nacional - (3) Internacional")
    coberturas = utils.helpers.sanitize_coverage(str(input("Qué coberturas tiene el medio de prensa? Ingresa los valores separados por comas (1, 2, 3): ")))
    if coberturas is None:
        raise utils.exceptions.CoberturasError
    return coberturas

# Insertar la informacion de las coberturas en la tabla `coberturasMedios`
def insert_coberturas_info(medio, coberturas) -> None:
    # Iteramos sobre cada cobertura obtenida
    for i in coberturas:
        # Insertamos las claves foraneas del medio y de la cobertura
        cursor.execute(utils.queries.INSERT_COVERAGE % (medio, i))

# Obtener la información para la tabla `ejemplos`
def get_ejemplo_info() -> str:
    url = str(input("Ingresa la URL de la noticia de ejemplo: "))
    if not utils.helpers.check_empty(url):
        raise utils.exceptions.EmptyError
    fecha = str(input("Ingresa el XPATH de la fecha de la noticia: "))
    if not utils.helpers.check_empty(fecha):
        raise utils.exceptions.EmptyError
    titulo = str(input("Ingresa el XPATH del titulo de la noticia: "))
    if not utils.helpers.check_empty(titulo):
        raise utils.exceptions.EmptyError
    desc = str(input("Ingresa el XPATH de la descripción de la noticia: "))
    if not utils.helpers.check_empty(desc):
        raise utils.exceptions.EmptyError
    return url, fecha, titulo, desc

# Insertar la información para la tabla `ejemplos`
def insert_ejemplo_info(medio: int, url: str, fecha: str, titulo: str, desc: str) -> None:
    # Ingresamos la información del ejemplo con la clave foránea del medio
    cursor.execute(utils.queries.INSERT_EXAMPLE % (medio, url, fecha, titulo, desc))

if __name__ == "__main__":

    if db is None:
        print(">> No se ha podido conectar a la base de datos, verifica las credenciales en config.py")
        sys.exit(1)

    nombre, año, url = get_medios_info()
    medio = insert_medios_ubicaciones_info(nombre, año, url)
    coberturas = get_coberturas_info()
    insert_coberturas_info(medio, coberturas)
    url, fecha, titulo, desc = get_ejemplo_info()
    insert_ejemplo_info(medio, url, fecha, titulo, desc)

    db.commit()