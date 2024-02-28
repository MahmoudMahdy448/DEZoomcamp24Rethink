# this should run by firstly giving a permission: chmod +x data-ingestion-run-python.sh
# then run the script: ./data-ingestion-run-python.sh

#!/bin/bash

# Load environment variables from .env file
source .env

URL="https://github.com/DataTalksClub/nyc-tlc-data/releases/download/yellow/yellow_tripdata_2021-01.csv.gz"

python ingest_data.py \
  --user=${USER} \
  --password=${PASSWORD} \
  --host=${HOST} \
  --port=${PORT} \
  --db=${DB} \
  --table_name=${TABLE_NAME} \
  --url=${URL}