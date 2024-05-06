# Terraform AWS EKS Cluster Deployment
This Terraform project automates the creation and destruction of a basic Amazon Elastic Kubernetes Service (EKS) cluster in AWS. It utilizes the remote AWS EKS module from the terraform-aws-modules/terraform-aws-eks repository.

## Requirements
Terraform >= 1.8.2
AWS CLI configured with appropriate credentials and permissions to access AWS services such as EKS, EC2, IAM, and VPC
## Usage
Clone this repository to your local machine:
```bash
git clone https://github.com/cmyahya/terraform-eks-demo.git
```
Navigate to the project directory:
```bash
cd terraform-eks-demo
```
Update the variables.tf file with your specific configuration such as namespace, region and kubernetes version.
Initialize Terraform:
```bash
terraform init
```
Review the Terraform plan:
```bash
terraform plan
```
Apply the Terraform configuration to create the EKS cluster:
```bash
terraform apply -auto-approve
```
Once finished, you can access your EKS cluster and manage Kubernetes resources as needed.
To destroy the EKS cluster and associated resources, run:
```bash
terraform destroy -auto-approve
```
## Network Diagram
Below is a basic network diagram illustrating the VPC, subnets, and the deployed EKS cluster for this demo:

![](/images/network_diagram.png)

- EKS cluster is deployed in two AZs in us-west-2 region
- EKS cluster is deployed in a private subnet
- NAT Gateway for the EKS cluster is created in the public subnet
- EKS cluster will only have SSH inbound traffic from public subnet EC2 instances
- Public subnet will have EC2 instances that act as proxy servers (Bastion hosts) for the EKS Cluster
- Only authorized IAM users will be able to ```ssh``` into EKS cluster nodes

## Notes
> - The EKS cluster is deployed in the us-west-2 region with the name Chinnu.
> - Kubernetes version 1.27 is used for the cluster.
> - A unique cluster service role is created for the cluster.
> - Resources created are tagged with OWNER: CHINNU_Y and CATEGORY: ENG_ASSESSMENT.
> - The node group is autoscaled based on CPU utilization with a max size of 6, min size of 3, and desired size of 4.
> - Amazon EKS optimized AMI is used for the worker nodes.
> - At least one namespace (chinnu) is created within the cluster.
> - VPC ID information can be read from the Terraform outputs.