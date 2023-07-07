import sys
import utils.queries
import utils.helpers
from utils.user_agents import random_agent
from requests_html import HTMLSession
from config import db, cursor

headers = { 'User-Agent': random_agent() }
session = HTMLSession()

if __name__ == "__main__":
    if not db:
        print(">> No se ha podido conectar a la base de datos. Por favor, verifica tus credenciales en config.py")
        sys.exit(1)
    nombre = str(input(">> Ingrese el nombre del medio de prensa: "))
    if not utils.helpers.check_empty(nombre):
        raise utils.exceptions.EmptyError
    url = str(input(">> Ingrese la URL de la noticia: "))
    if not utils.helpers.check_empty(url):
        raise utils.exceptions.EmptyError
    cursor.execute(utils.queries.SCRAPING % nombre)
    row = cursor.fetchone()
    if row:
        response = session.get(url, headers=headers)
        title = response.html.xpath(row[1])[0].text
        date = response.html.xpath(row[0])[0]
        print(">> Título: {0}".format(title))
        if type(date) is str:
            print(">> Fecha: {0}".format(date))    
        else:
            print(">> Fecha: {0}".format(date.text.strip()))
    else:
        print(">> No hay resultados ")