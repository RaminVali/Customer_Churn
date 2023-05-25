
# Telco Customer Churn Prediction

data originally from [here](https://community.ibm.com/community/user/businessanalytics/blogs/steven-macko/2019/07/11/telco-customer-churn-1113)

Got retrieved from hugging face [here](https://huggingface.co/datasets/scikit-learn/churn-prediction)

# Set up

## Pre requisits:
Azure subscription

## Provision Workspace and Compute resources
Go to Azure [portal](https://portal.azure.com/#home), cloud shell, open bash
type the following in the terminal (or use shit + insert)
``` 
 rm -r Customer_Churn -f
git clone https://github.com/RaminVali/Customer_Churn
```

After the repo has been cloned, enter the following commands
```
cd Customer_Churn
./setup.sh
```

if you get permission denied error run: 
```
chmod +x setup.sh
```
before running the ```setup.sh``` file.

Wait for the script to complete - this typically takes around 5-10 minutes.

# Clone repository into the Azure ML Studio
- In the Azure portal, navigate to the Azure Machine Learning workspace named ```customer_churn_proj```.
- Select the Azure Machine Learning workspace, and in its Overview page, select Launch studio. - Another tab will open in your browser to open the Azure Machine Learning studio.
- Close any pop-ups that appear in the studio.
- Within the Azure Machine Learning studio, navigate to the Compute page and verify that the compute instance and cluster you created in the previous section exist. The compute instance should be running, the cluster should be idle and have 0 nodes running.
- In the Compute instances tab, find your compute instance, and select the Terminal application.
- In the terminal, install the Python SDK on the compute instance by running the following commands in the terminal:

```
 pip uninstall azure-ai-ml
 pip install azure-ai-ml
 pip install mltable

 ```

- Run the following command to clone a Git repository containing notebooks, data, and other files to your workspace: 

```
git clone https://github.com/RaminVali/Customer_Churn
```
Once clones open the nb1 notebook in the compute instance created 

Refresh the file explorer pane

click on nb1.ipynb and open it. Run the cells in the same order as presented.
You will have to wait for some of the cells to have the desired effect in azure ml before proceeding. This can take anywhere form 5 to 20 minutes. Normally we will wait for the notification to pop up. 
# Add which Kernel to select - like Python 3.10 - SDK v2

Add your subscription ID in the appropriate place in the second cell