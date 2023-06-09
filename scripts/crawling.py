import sys
import time
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
    categoria = str(input(">> Ingrese el nombre de la categoría: "))
    if not utils.helpers.check_empty(categoria):
        raise utils.exceptions.EmptyError
    cursor.execute(utils.queries.CRAWLING % (nombre, categoria))
    res = cursor.fetchone()
    if res:
        response = session.get(res[1], headers=headers)
        all_urls = response.html.xpath(res[2])
        for url in all_urls:
            article_url = res[0] + url
            print(">> {0}".format(article_url))
            time.sleep(2)
    else:
        print(">> No hay resultados")