#!/bin/bash
BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CONFIG="${BASEDIR}/../../config/config.sh"
source "${CONFIG}"

echo "Iniciando a criacao em ${DATE}"

for table in "${TABLES[@]}"
do
	echo "tabela $table"
    cd ../../raw/
    mkdir $table
    
    hdfs dfs -mkdir /datalake/raw/$table
    hdfs dfs -chmod 777 /datalake/raw/$table
    hdfs dfs -copyFromLocal $table.csv /datalake/raw/$table
    beeline -u jdbc:hive2://localhost:10000 -f ../../scripts/hql/create_table_$table.hql 
done

echo "Finalizando a criacao em ${DATE}"