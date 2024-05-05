# Terraform AWS EKS Cluster Deployment
This Terraform project automates the creation and destruction of a basic Amazon Elastic Kubernetes Service (EKS) cluster in AWS. It utilizes the remote AWS EKS module from the terraform-aws-modules/terraform-aws-eks repository.

## Requirements
Terraform >= 1.8.2
AWS CLI configured with appropriate credentials and permissions to access AWS services such as EKS, EC2, IAM, and VPC
## Usage
Clone this repository to your local machine:
```bash
Copy code
git clone https://github.com/cmyahya/terraform-eks-demo.git
Navigate to the project directory:
bash
Copy code
cd terraform-eks-demo
Update the variables.tf file with your specific configuration such as namespace, region and kubernetes version.
Initialize Terraform:
bash
Copy code
terraform init
Review the Terraform plan:
bash
Copy code
terraform plan
Apply the Terraform configuration to create the EKS cluster:
bash
Copy code
terraform apply -auto-approve
```
Once finished, you can access your EKS cluster and manage Kubernetes resources as needed.
To destroy the EKS cluster and associated resources, run:
```bash
Copy code
terraform destroy -auto-approve
```
## Network Diagram
Below is a basic network diagram illustrating the VPC, subnets, and the deployed EKS cluster:
![](/images/network_diagram.png)

## Notes
> The EKS cluster is deployed in the us-west-2 region with the name Chinnu.
> Kubernetes version 1.27 is used for the cluster.
> A unique cluster service role is created for the cluster.
> Resources created are tagged with OWNER: CHINNU_Y and CATEGORY: ENG_ASSESSMENT.
> The node group is autoscaled based on CPU utilization with a max size of 6, min size of 3, and desired size of 4.
> Amazon EKS optimized AMI is used for the worker nodes.
> At least one namespace (chinnu) is created within the cluster.
> VPC ID information can be read from the Terraform outputs.