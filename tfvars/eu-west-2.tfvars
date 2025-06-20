# eu-west-2 resources

# Location
region        = "London"
region_prefix = "eu-west-2"

# Networking
vpc_cidr             = "10.0.0.0/21"
subnet1_public_cidr  = "10.0.0.0/24"
subnet1_private_cidr = "10.0.1.0/24"
subnet2_private_cidr = ""

# S3
bucket_encryption_key_arn = "arn:aws:kms:eu-west-2:137502009769:key/a8727e37-7736-40f9-8235-ee60f1e9c20d"

# Conditional
just_eu_west_2 = true
