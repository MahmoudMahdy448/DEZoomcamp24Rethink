# this should run by firstly giving a permission: chmod +x data-ingestion-run-docker.sh
# then run the script: ./data-ingestion-run-docker.sh

source .env

URL="https://github.com/DataTalksClub/nyc-tlc-data/releases/download/yellow/yellow_tripdata_2021-01.csv.gz"

docker run -it \
  --network=${NETWORK} \
  ingest-data:v001 \
  --user=${USER} \
  --password=${PASSWORD} \
  --host=${HOST} \
  --port=${PORT} \
  --db=${DB} \
  --table_name=${TABLE_NAME} \
  --url=${URL}