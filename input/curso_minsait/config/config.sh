#!/bin/bash

DATE="$(date --date="-0 day" "+%Y%m%d")"

TABLES=("cidade" "estado" "filial" "parceiro" "cliente" "subcategoria" "categoria" "item_pedido" "produto")
TABELA_CLIENTE="TBL_CLIENTE"

TARGET_DATABASE="aula_hive"
SERVER="prod"
HDFS_DIR="/datalake/raw/categoria"
TARGET_TABLE_EXTERNAL="categoria"
TARGET_TABLE_GERENCIADA="tbl_categoria"

PARTICAO="$(date --date="-0 day" "+%Y%m%d")"