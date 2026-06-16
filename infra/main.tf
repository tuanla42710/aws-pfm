provider "aws" {
    region = "ap-southeast-2"
}


module "my_vpc" {
    source = "./module/vpc"
    vpc_name = "production_vpc"
    vpc_cidr = "10.0.0.0/16"
    public_cidr_blocks   = ["10.0.1.0/24"]
    private_cidr_blocks  = ["10.0.2.0/24"]
    availability_zones   = ["ap-southeast-2a", "ap-southeast-2b"]


}

module "database" {
    source = "./module/database"
    vpc_id = module.my_vpc.vpc_id
    private_subnet_ids = module.my_vpc.private_subnet_ids

}

output "database_endpoint" {
  description = "Endpoint kết nối tới MySQL Database"
  value       = module.my_database.rds_endpoint
}