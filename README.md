
# Telecommunication Company Customer Churn Prediction
This project presents an end to end machine learning task. All the stages of a normal machine learning life cycle have been preformed and presented. The aim of the project is to develop a prediction model for telecommunication company (telco) customer churn and put this into production using Azure ML. 

## Motivation
The Global Telecommunication [Market](https://www.skyquestt.com/report/telecommunication-market#:~:text=Global%20Telecommunication%20Market%20size%20was,a%20set%20of%20communication%20instruments.) size was valued at USD 1700.2 billion in 2021 and is poised to grow from USD 1805.61 billion in 2022 to USD 3102.74 billion by 2030. Given how large and competitive this industry is, the telcos have a vested interest in retaining their customer base, as acquiring new customers is costly. 

Therefore, the goal of predicting if a customer will move to a competitor (churn) is motivated. If the telco can get to the customers who are on the verge of churning before they do so, they can offer incentive for the customer to stay. The churn can be predicted using the customer data and machine learning techniques. 

## Data Source
The telco customer churn data is originally from [here](https://community.ibm.com/community/user/businessanalytics/blogs/steven-macko/2019/07/11/telco-customer-churn-1113)and the data for the project is retrieved from hugging face [here](https://huggingface.co/datasets/scikit-learn/churn-prediction). A copy can be retrieved under the data folder.

## Repository Contents
- EDA.ipynb: The explotary data analysis is presented in the EDA notebook. It involves all the standard procedure for data exploration, cleaning, feature engineering and feature extraction.

- requirements.txt: The packages required to run the EDA.

- production.ipynb: This notebook works through the whole production section beginning with the connection with the workspace, creating the data asset, creating compute cluster, creating the custom pipeline environment, creating pipeline components with [Python SDK V2](https://learn.microsoft.com/en-us/azure/machine-learning/concept-v2?view=azureml-api-2#azure-machine-learning-python-sdk-v2), loading and executing the pipeline, registering the model, creating an online endpoint, and finally endpoint deployment.

- sample_data.json: input to test the online deployment.

- setup.sh: shell file to provision the resource group and workspace for the project using the Azure CLI. This file has to be run in Azure portal cloud shell first. 

# EDA Setup
The environment requirements are included in requirements.exe; as such they can be installed in an environment and run the EDA notebook.

# Production Setup: 

## Pre-requisites:
You will need a Azure subscription for this. Once you have that you can follow to the next step.

## Provision Workspace and Compute resources
Go to Azure [portal](https://portal.azure.com/#home), cloud shell, open bash
type the following in the terminal (or use shit + insert)
``` 
rm -r Customer_Churn -f
git clone https://github.com/RaminVali/Customer_Churn
```

After the repository has been cloned, enter the following commands
```
cd Customer_Churn
./setup.sh
```

If you get permission denied error run after cd-ing into the root folder: 
```
chmod +x setup.sh
```
before running the ```setup.sh``` file. The  ```setup.sh``` will create the workspace, resource group and the compute instance required to run the project for production. 

Wait for the script to complete - this typically takes around 5-10 minutes.

## Clone repository into the Azure ML Studio
In the Azure portal, navigate to the Azure Machine Learning workspace named ```customer_churn_proj```.

Select the Azure Machine Learning workspace just created, and in its overview page, select Launch studio.

Another tab will open in your browser to open the Azure Machine Learning studio.

Close any pop-ups that appear in the studio.

Within the Azure Machine Learning studio, navigate to the Compute page and verify that the compute instance and cluster you created in the previous section exist. The compute instance should be running, the cluster should be idle and have 0 nodes running.

In the Compute instances tab, find your compute instance, and select the Terminal application.

In the terminal, install the Python SDK on the compute instance by running the following commands in the terminal:

```
 pip uninstall azure-ai-ml
 pip install azure-ai-ml
 ```

- Run the following command to clone a Git repository containing notebooks, data, and other files to your workspace: 

```
git clone https://github.com/RaminVali/Customer_Churn
```
Once clones open the nb1 notebook in the compute instance created 

Refresh the file explorer pane and click on production.ipynb and open it. Please select Python 3.10 - SDK v2 and run the cells in the same order as presented, noting the steps that require for you to wait while environments/compute clusters etc, are spun. 

You will need to add your subscription ID in the appropriate place in the second cell.

# Production Discussion:
Beginning with the data, it is best to register it as an asset. Once the data is registered as an asset in the workspace, it will appear under the data tab:

## Creating a data asset
Once the data asset is created you have to 
![Registered Dataset](img/Data-registered.png)

## Compute cluster for pipeline
