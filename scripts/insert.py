import sys
import utils.helpers
import utils.exceptions
import utils.queries
from config import db, cursor

def get_medios_info() -> str:
    nombre = str(input(">> Ingresa el nombre del medio de prensa: "))
    if not utils.helpers.check_empty(nombre):
        raise utils.exceptions.EmptyError
    año = utils.helpers.sanitize_year(str(input(">> Ingresa el año de fundación del medio (vacío en caso de no saberlo): ")))
    url = str(input(">> Ingresa el sitio web del medio: "))
    if not utils.helpers.check_empty(url):
        raise utils.exceptions.EmptyError
    return nombre, año, url

def get_ubicaciones_info() -> str:
    ciudad = str(input(">> Ingresa el nombre de la ciudad: "))
    if not utils.helpers.check_empty(ciudad):
        raise utils.exceptions.EmptyError
    pais = str(input(">> Ingresa el nombre del pais: "))
    if not utils.helpers.check_empty(pais):
        raise utils.exceptions.EmptyError
    region = str(input(">> Ingresa el nombre de la región: "))
    if not utils.helpers.check_empty(region):
        raise utils.exceptions.EmptyError
    continente = str(input(">> Ingresa el nombre del continente: "))
    if not utils.helpers.check_empty(continente):
        raise utils.exceptions.EmptyError
    return ciudad, pais, region, continente

def insert_medios_ubicaciones_info(nombre: str, año: str, url: str) -> int:
    cursor.execute(utils.queries.CHECK_EXISTING_NAME % nombre)
    res_1 = cursor.fetchone()
    if res_1 is not None:
        raise utils.exceptions.MediaNameError
    cursor.execute(utils.queries.CHECK_EXISTING_URL % url)
    res_2 = cursor.fetchone()
    if res_2 is not None:
        raise utils.exceptions.MediaURLError
    if res_1 is not None and res_2 is not None:
        raise utils.exceptions.MediaError
    else:
        ubi = int(input(">> Existe una ubicación para el medio? (0 NO, 1 SI): "))
        if ubi:
            ciudad, pais, region, continente = get_ubicaciones_info()
            cursor.execute(utils.queries.CHECK_EXISTING_LOC % (ciudad, pais, region, continente))
            res = cursor.fetchone()
            if res is None:
                cursor.execute(utils.queries.INSERT_LOCATION % (ciudad, pais, region, continente))
            ubi_id = cursor.lastrowid if res is None else res[0]
            if año is None:
                cursor.execute(utils.queries.INSERT_MEDIA_OUTLET_WY % (nombre, ubi_id, url))
            else:
                cursor.execute(utils.queries.INSERT_MEDIA_OUTLET % (nombre, ubi_id, año, url))
        else:
            if año is None:
                cursor.execute(utils.queries.INSERT_MEDIA_OUTLET_WU_WY % (nombre, url))
            else:
                cursor.execute(utils.queries.INSERT_MEDIA_OUTLET_WU % (nombre, año, url))
        return cursor.lastrowid

def get_coberturas_info() -> list:
    coberturas = []
    local = int(input(">> El medio tiene cobertura Local? (0 NO, 1 SI): "))
    if local:
        coberturas.append(1)
    nacional = int(input(">> El medio tiene cobertura Nacional? (0 NO, 1 SI): "))
    if nacional:
        coberturas.append(2)
    internacional = int(input(">> El medio tiene cobertura Internacional? (0 NO, 1 SI): "))
    if internacional:
        coberturas.append(3)
    return coberturas

def insert_coberturas_info(medio: int, coberturas: list) -> None:
    for i in coberturas:
        cursor.execute(utils.queries.INSERT_COVERAGE % (medio, i))

def get_ejemplo_info() -> str:
    url = str(input(">> Ingresa la dirección URL de la noticia de ejemplo: "))
    if not utils.helpers.check_empty(url):
        raise utils.exceptions.EmptyError
    fecha = str(input(">> Ingresa la expresión XPATH de la fecha de la noticia: "))
    if not utils.helpers.check_empty(fecha):
        raise utils.exceptions.EmptyError
    titulo = str(input(">> Ingresa la expresión XPATH del titulo de la noticia: "))
    if not utils.helpers.check_empty(titulo):
        raise utils.exceptions.EmptyError
    desc = str(input(">> Ingresa la expresión XPATH de la descripción de la noticia: "))
    if not utils.helpers.check_empty(desc):
        raise utils.exceptions.EmptyError
    return url, fecha, titulo, desc

def insert_ejemplo_info(medio: int, url: str, fecha: str, titulo: str, desc: str) -> None:
    cursor.execute(utils.queries.INSERT_EXAMPLE % (medio, url, fecha, titulo, desc))

def get_redes_info() -> list:
    data = [ { "id": 1, "name": "Facebook", "hasNetwork": False },
             { "id": 2, "name": "Instagram", "hasNetwork": False },
             { "id": 3, "name": "Twitter", "hasNetwork": False } ]
    for i in range(3):
        has_social = int(input(">> El medio tiene %s? (0 NO, 1 SI): " % data[i]["name"]))
        if has_social:
            handle = str(input(">> Ingrese la cuenta de %s del medio: " % data[i]["name"]))
            if not utils.helpers.check_empty(handle):
                raise utils.exceptions.EmptyError
            followers = int(input(">> Ingrese la cantidad de seguidores de la red social: "))
            data[i]["handle"] = handle
            data[i]["followers"] = followers
            data[i]["hasNetwork"] = True
    return data

def insert_redes_info(medio, data) -> None:
    for network in data:
        if network["hasNetwork"]:
            cursor.execute(utils.queries.INSERT_NETWORK % (medio, network["id"], network["handle"], network["followers"]))

def get_fundadores_info() -> list:
    founders = []
    num_founders = int(input(">> Ingrese el número de fundadores que tiene el medio: "))
    for i in range(num_founders):
        founder = {}
        founder["name"] = str(input(">> Ingrese el nombre del fundador #%s: " % str(i + 1)))
        if not utils.helpers.check_empty(founder["name"]):
            raise utils.exceptions.EmptyError
        founder["surname"] = str(input(">> Ingrese el apellido del fundador #%s: " % str(i + 1)))
        if not utils.helpers.check_empty(founder["surname"]):
            raise utils.exceptions.EmptyError
        founder["nationality"] = str(input(">> Ingrese la nacionalidad del fundador #%s (vacío en caso de no sabrelo): " % str(i + 1)))
        founder["dob"] = str(input(">> Ingrese la fecha de nacimiento del fundador #%s (DD-MM-YYY o vacío en caso de no saberlo): " % str(i + 1)))
        founders.append(founder)
    return founders

def insert_fundadores_info(medio, data) -> None:
    for founder in data:
        cursor.execute(utils.queries.CHECK_EXISTING_FOUNDER % (founder["name"], founder["surname"]))
        res = cursor.fetchone()
        if res is None:
            if founder["nationality"] == "" and founder["dob"] == "":
                cursor.execute(utils.queries.INSERT_FOUNDER_WN_WD % (founder["name"], founder["surname"]))
            elif founder["nationality"] == "" and founder["dob"] != "":
                cursor.execute(utils.queries.INSERT_FOUNDER_WN % (founder["name"], founder["surname"], founder["dob"]))
            elif founder["dob"] == "" and founder["nationality"] != "":
                cursor.execute(utils.queries.INSERT_FOUNDER_WD % (founder["name"], founder["surname"], founder["nationality"]))
            else:
                cursor.execute(utils.queries.INSERT_FOUNDER % (founder["name"], founder["surname"], founder["nationality"], founder["dob"]))
        founder_id = cursor.lastrowid if res is None else res[0]
        cursor.execute(utils.queries.INSERT_MEDIA_FOUNDERS % (medio, founder_id))
    
def get_categorias_info() -> list:
    categorias = []
    num_categorias = int(input(">> Ingrese el número de categorías a ingresar al medio: "))
    for i in range(num_categorias):
        categoria = {}
        categoria["name"] = str(input(">> Ingrese el nombre de la categoría #%s: " % str(i + 1)))
        if not utils.helpers.check_empty(categoria["name"]):
            raise utils.exceptions.EmptyError
        categoria["url"] = str(input(">> Ingrese la dirección URL de la categoría #%s: " % str(i + 1)))
        if not utils.helpers.check_empty(categoria["url"]):
            raise utils.exceptions.EmptyError
        categoria["ejemplo"] = str(input(">> Ingrese la dirección URL de una página de la categoría #%s: " % str(i + 1)))
        if not utils.helpers.check_empty(categoria["ejemplo"]):
            raise utils.exceptions.EmptyError
        categoria["xpath"] = str(input(">> Ingrese la expresión XPATH para obtener los enlaces de la categoría #%s: " % str(i + 1)))
        if not utils.helpers.check_empty(categoria["xpath"]):
            raise utils.exceptions.EmptyError
        categorias.append(categoria)
    return categorias

def insert_categorias_info(medio, data) -> None:
    for categoria in data:
        cursor.execute(utils.queries.CHECK_EXISTING_CATEGORY % (categoria["name"]))
        res = cursor.fetchone()
        if res is None:
            cursor.execute(utils.queries.INSERT_CATEGORY % (categoria["name"]))
        cat_id = cursor.lastrowid if res is None else res[0]
        cursor.execute(utils.queries.INSERT_MEDIA_CATEGORY % (medio, cat_id, categoria["url"], categoria["ejemplo"], categoria["xpath"]))

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
    redes = get_redes_info()
    insert_redes_info(medio, redes)
    fundadores = get_fundadores_info()
    insert_fundadores_info(medio, fundadores)
    categorias = get_categorias_info()
    insert_categorias_info(medio, categorias)

    db.commit()
    db.close()