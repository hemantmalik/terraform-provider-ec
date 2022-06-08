# Deployment with an EC2 Instance example

This example shows how to build an application's infrastructure using Azure VM instances and an Elastic Cloud deployment, while communicating securely using traffic filters.
The code creates an Azure VM instance in your network and subnet, but uses the instance's public IP address to configure a traffic filter connecting it back to the Elastic Cloud deployment.
Such communication can also be done through this Terraform provider using Azure Private Link.

## Running the example
To run the example, follow these steps:
1. Build the provider by running `make install` from the main folder.
2. Run `terrafrom init` to initialize your Terraform CLI.
3. Modify the `variables.tf` file to add your Azure profile and Elastic cloud key.
4. Run `terraform apply` to check if it works.
