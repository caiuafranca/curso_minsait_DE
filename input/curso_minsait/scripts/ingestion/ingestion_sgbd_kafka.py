from kafka import KafkaProducer
import json
from sqlalchemy import create_engine
import pymysql
import pandas as pd

cnx = create_engine('mysql+pymysql://root:secret@localhost:33061/employees')  
dbConnection = cnx.connect()
dados_mysql = pd.read_sql("select * from employees.employees", dbConnection); 

dados = dados_mysql.to_json()

producer = KafkaProducer(bootstrap_servers='localhost:9092')

enviar_dados = lambda dados : json.dumps(dados).encode('utf-8')

producer.send('ingestao_employees', enviar_dados)