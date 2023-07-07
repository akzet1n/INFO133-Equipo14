import utils.helpers
import utils.queries as queries
from config import db, cursor

data = [ { "id": 1, "msg": "Cúal es el XPATH para leer la fecha de la noticia de un medio?", "sql": queries.XPATH_DATE, "func": 1},
         { "id": 2, "msg": "Cuáles son los fundadores de un medio?", "sql": queries.FOUNDERS, "func": 1},
         { "id": 3, "msg": "Cuáles son las categorías de un medio?", "sql": queries.CATEGORIES, "func": 1},
         { "id": 4, "msg": "Cuáles son las redes sociales de un medio?", "sql": queries.NETWORKS, "func": 1},
         { "id": 5, "msg": "Cuántos medios existentes hay en la base de datos?", "sql": queries.COUNT_MEDIA_OUTLETS, "func": 2},
         { "id": 6, "msg": "Cuántos seguidores tiene un medio en sus redes sociales?", "sql": queries.SUM_FOLLOWERS, "func": 1},
         { "id": 7, "msg": "Cúal es la página web de un medio?", "sql": queries.MEDIA_OUTLET_URL, "func": 1},
         { "id": 8, "msg": "Cuándo fue la última vez que se actualizaron los seguidores de una red social de un medio?", "sql": queries.LAST_UPDATE, "func": 3},
         { "id": 9, "msg": "Cuántos medios de prensa tiene un fundador?", "sql": queries.COUNT_MEDIA_FOUNDERS, "func": 4},
         { "id": 10, "msg": "Cuántos medios hay en una ubicación?", "sql": queries.COUNT_MEDIA_LOCATIONS, "func": 5},
         { "id": 11, "msg": "Cuántas cuentas de alguna red social tienen sobre 50.000 seguidores?", "sql": queries.MEDIA_OVER_50K, "func": 6 },
         { "id": 12, "msg": "Cuál es el promedio de seguidores por cada red social?", "sql": queries.MEDIA_AVERAGE, "func": 2} ]

if __name__ == "__main__":
    for query in data:
        print("[{0}] {1}".format(query["id"], query["msg"]))
    choice = int(input(">> Ingrese una sentencia SQL a consultar: "))
    if choice >= 1 and choice <= 12:
        query = data[choice - 1]
        if query["func"] == 1:
            nombre = str(input(">> Ingrese el nombre del medio de prensa: "))
            if not utils.helpers.check_empty(nombre):
                raise utils.exceptions.EmptyError
            cursor.execute(query["sql"] % nombre)
        elif query["func"] == 2:
            cursor.execute(query["sql"])
        elif query["func"] == 3:
            nombre = str(input(">> Ingrese el nombre del medio de prensa: "))
            if not utils.helpers.check_empty(nombre):
                raise utils.exceptions.EmptyError
            red = str(input(">> Ingrese la red social a buscar: "))
            if not utils.helpers.check_empty(red):
                raise utils.exceptions.EmptyError
            cursor.execute(query["sql"] % (nombre, red))
        elif query["func"] == 4:
            nombre = str(input(">> Ingrese el nombre del fundador: "))
            if not utils.helpers.check_empty(nombre):
                raise utils.exceptions.EmptyError
            apellido = str(input(">> Ingrese el apellido del fundador: "))
            if not utils.helpers.check_empty(apellido):
                raise utils.exceptions.EmptyError
            cursor.execute(query["sql"] % (nombre, apellido))
        elif query["func"] == 5:
            ciudad = str(input(">> Ingrese la ciudad: "))
            if not utils.helpers.check_empty(ciudad):
                raise utils.exceptions.EmptyError
            pais = str(input(">> Ingrese el apellido del fundador: "))
            if not utils.helpers.check_empty(pais):
                raise utils.exceptions.EmptyError
            cursor.execute(query["sql"] % (ciudad, pais))
        elif query["func"] == 6:
            red = str(input(">> Ingrese la red social a buscar: "))
            if not utils.helpers.check_empty(red):
                raise utils.exceptions.EmptyError
            cursor.execute(query["sql"] % (red))
        rows = cursor.fetchall()
        if rows:
            for row in rows:
                if query["id"] == 2:
                    print(">> {0} {1}".format(row[0], row[1]))
                elif query["id"] == 4:
                    print(">> {0}: {1} - Seguidores: {2}".format(row[0], row[1], row[2]))
                elif query["id"] == 12:
                    print(">> {0}: {1}".format(row[0], row[1]))
                else:
                    print(">> {0}".format(row[0]))
        else:
            print(">> No hay resultados")
    db.close()