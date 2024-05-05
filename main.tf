module "networking" {
    source  = "./modules/networking" 
}


module "eks_cluster" {
    source  = "./modules/eks_cluster" 
}