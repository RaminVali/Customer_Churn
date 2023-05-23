
#! /usr/bin/sh

echo "Welcome to the Customer Churn Prediction Project:"

# Create workspace
echo "Create a resource group:"
az group create --name "rg-churn-pred-proj" --location "eastus"

echo "Create an Azure Machine Learning workspace:"
az ml workspace create --name "churn-pred-proj" -g "rg-churn-pred-proj"

# Create compute instance
guid=$(cat /proc/sys/kernel/random/uuid)
suffix=${guid//[-]/}
suffix=${suffix:0:18}

ComputeName="ci${suffix}"

echo "Creating a compute instance with name: " $ComputeName
az ml compute create --name ${ComputeName} --size STANDARD_DS11_V2 --type ComputeInstance -w churn-pred-proj -g rg-churn-pred-proj

# Create compute cluster
echo "Creating a compute cluster with name: aml-cluster"
az ml compute create --name "aml-cluster" --size STANDARD_DS11_V2 --max-instances 2 --type AmlCompute -w churn-pred-proj -g rg-churn-pred-proj