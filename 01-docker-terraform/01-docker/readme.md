# Running Docker-Terraform Environment

This repository contains a Docker-Terraform environment for setting up a PostgreSQL database and pgAdmin. Follow the steps below to get started:

### Prerequisites
- Docker installed on your machine
- Python installed on your machine

### Setup Instructions

1. **Navigate to the directory 01-docker-terraform:**
    ```bash
    cd 01-docker-terraform
    ```

2. **Run Docker Compose:**
    This command creates PostgreSQL database and pgAdmin images:
    ```bash
    docker-compose up
    ```

3. **Ingest Data into PostgreSQL Database:**
    After setting up the Docker environment, you need to ingest data into the PostgreSQL database. Use the following command:

    ```bash
    URL="https://github.com/DataTalksClub/nyc-tlc-data/releases/download/yellow/yellow_tripdata_2021-01.csv.gz"

    python ingest_data.py \
      --user=root \
      --password=root \
      --host=localhost \
      --port=5432 \
      --db=ny_taxi \
      --table_name=yellow_taxi_trips \
      --url=${URL}
    ```

    This command will download the data from the provided URL and ingest it into the specified PostgreSQL database with the provided credentials.

### Additional Notes
- Make sure that Docker is running and accessible on your system before running the above commands.
- Ensure that you have sufficient permissions to run Docker commands and access the necessary directories.
- Adjust parameters such as `user`, `password`, `host`, `port`, `db`, and `table_name` according to your setup if needed. 
- The provided URL for data ingestion is for reference. You can replace it with any other valid URL containing the data you want to ingest.

Feel free to reach out if you encounter any issues or have any questions!
