source .env

URL="https://github.com/DataTalksClub/nyc-tlc-data/releases/download/yellow/yellow_tripdata_2021-01.csv.gz"

docker run -it \
  --network=${NETWORK} \
  ingest_data:v001 \
  --user=${USER} \
  --password=${PASSWORD} \
  --host=${HOST} \
  --port=${PORT} \
  --db=${DB} \
  --table_name=${TABLE_NAME} \
  --url=${URL}