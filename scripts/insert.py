import sys
import utils.helpers
import utils.exceptions
import utils.queries
from config import db, cursor

# Obtener la información para la tabla `medios`
def get_medios_info() -> None:
    nombre = str(input("Ingresa el nombre del medio de prensa: "))
    if not utils.helpers.check_empty(nombre):
        raise utils.exceptions.EmptyError
    año = utils.helpers.sanitize_year(str(input("Ingresa el año de fundación del medio de prensa (vacío en caso de no saberlo): ")))
    url = str(input("Ingresa el sitio web del medio de prensa: "))
    if not utils.helpers.check_empty(url):
        raise utils.exceptions.EmptyError
    return nombre, año, url

# Obtener la información para la tabla `ubicaciones`
def get_ubicaciones_info() -> None:
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
def insert_medios_ubicaciones_info(nombre: str, año: str, url: str) -> None:
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
    # Si el nombre del medio está ingresado, devolvemos un error
    if res_1 is not None:
        raise utils.exceptions.MediaNameError
    # Si la URL del medio está ingresada, devolvemos un error
    if res_2 is not None:
        raise utils.exceptions.MediaURLError
    
if __name__ == "__main__":

    if db is None:
        print(">> No se ha podido conectar a la base de datos, verifica las credenciales en config.py")
        sys.exit(1)

    nombre, año, url = get_medios_info()
    insert_medios_ubicaciones_info(nombre, año, url)

    db.commit()