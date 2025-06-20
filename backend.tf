# backend state file s3 storage
terraform {
  backend "s3" {
    region       = ""
    bucket       = ""
    key          = ""
    encrypt      = true
    kms_key_id   = ""
    use_lockfile = true # no more DynamoDB
  }
}
