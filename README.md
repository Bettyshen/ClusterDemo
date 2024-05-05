# ClusterDemo
Author: Fang-Yu (Betty) Shen;
Date: May 5, 2024
## Goal
This tutorial demonstrates running R script through COE High Performance Computing Cluster (HPC)(i.e., cluster, supercomputer) with parallel computing which maximizes computation efficacy.
## Pros
The biggest benefit of running your R script through cluster is parallel computing, which means your task can be implemented into multiple cores at once. Because when you run your R script in R from your desktop, the script will run on one core. With parallel computing, you can run your script with multiple cores. Of course, you will need to set up parallel computing R code in your script to activate this function. More information on how to create R script for parallel computing can refer to [this webpage](https://www.r-bloggers.com/2017/10/running-r-code-in-parallel/)
## Cons
Of course, not everything comes to good side. The biggest challenge to run parallel on the cluster is taking more steps to submit and edit changes to the script. Once you find error in your script, you will have to edit your code and resubmit again. Sometimes, it is time-consuming if you were to modify many lines of code from your local computer and upload the script again. Although you can edit the script on the cluster portal, it is not recommended because you shouldn't be storing your file on cluster. Plus, you might lose track when making edits on cluster portal without synchronously updating the script on your local computer or file directory. I do recommend running a partial of your script on your local machine and making sure the process looks great before submitting your task through cluster.

# Instructions
## Create a College of Engineering HPC Account
1. Since we are not College of Engineering students, we need to request an account from [HPC administration](https://it.engineering.oregonstate.edu/hpc).

![request an account on HPC page](CreatAccount.png)

2. After creating your account, log in to the [HPC portal](https://ondemand.hpc.engr.oregonstate.edu/). It is performed by the OnDemand interface. You will be prompted to enter your account and passwords.
![Log in to On Demand portal](HPC-login.png)

## OnDemand Portal
1. Once you log into OnDemand portal, you will see the home page. On the top of the page, click the **Files** and then **Home Directory**. You will see all directories associated with your account.

![Home page of OnDemand portal](OnDemand_home.png)

2. In your home directory, click the **hpc-share** folder. This folder will be your working folder, where all scripts and data are stored.

![hpc-sharee folder](hpc_location.png)

## Create Folder & Upload files
1. To stay well-organized, it is recommended to create a folder for your specific project. Click the **New Directory** button to create a folder for your project.

![Create a working folder for your project](NewDirectory.png)

2. Now, you can click the **Upload** button to upload all your R scripts, data, and bash scripts (.sh). Humm...what is a bash script? Bash script is a script that tells the cluster what to do with your code, including what program you are running, and how many memories and cores you are requesting. Check out the example bash script I provided in this repository.

![Upload files](UploadFile.png)

>[!NOTE]
> In this tutorial, R script (detectionFunction.R), bird data (multiSP_Data.csv), and bash script (detectionFunction.sh) are provided. Please check out those files in this repository.
>[!IMPORTANT]
> Please make sure your R script has all correct paths to the directory that links to OnDemand portal since all your data is stored here. You will no longer access files on your local computer.

## Create & Submit Job
1. To create a job that runs your script, click **Jobs** and then **Job Composer**. It will take you to the next page to let you point out which bash script to run your code.

![Compose Job](CreatJob.png)

2. Hit the **New Job** button and select **From Specific Path**
