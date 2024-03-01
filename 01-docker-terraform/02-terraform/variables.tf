variable "credentials_file_path" {
    description = "value of the credentials file"
    default     = "./keys/my-creds.json"
  
}

variable "project" {
  description = "project"
  default     = "nyc-tl-taxi"

}

variable "region" {
  description = "Project region name"
  default     = "us-central1"

}


variable "location" {
  description = "Project location name"
  default     = "US"

}

variable "bq_dataset_name" {
  description = "my bigquery dataset name"
  default     = "demo_bq_dataset"
}

variable "gcs_bucket_name" {
  description = "my storage bucket name"
  default     = "nyc-tl-taxi-terra-bucket"
}

variable "gcs_storage_class" {
  description = "bucket storage class"
  default     = "STANDARD"
}

