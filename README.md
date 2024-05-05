# ClusterDemo
Author: Fang-Yu (Betty) Shen;
Date: May 5, 2024
## Goal
This tutorial demonstrates running R script through COE High Performance Computing Cluster (i.e., cluster, supercomputer), maximizing computation efficacy.
## Pros
The biggest benefit of running your R script through cluster is parallel computing, which means your task can be implemented into multiple cores at once. Because when you run your R script in R from your desktop, the script will run on one core. With parallel computing, you can run your script with multiple cores. Of course, you will need to set up parallel computing R code in your script to activate this function. More information on how to create R script for parallel computing can refer to [this webpage](https://www.r-bloggers.com/2017/10/running-r-code-in-parallel/)
## Cons
Of course, not everything comes to good side. The biggest challenge to run parallel on the cluster is taking more steps to submit and edit changes to the script. Once you find error in your script, you will have to edit your code and resubmit again. Sometimes, it is time-consuming if you were to modify many lines of code from your local computer and upload the script again. Although you can edit the script on the cluster portal, it is not recommended because you shouldn't be storing your file on cluster. Plus, you might lose track when making edits on cluster portal without synchronously updating the script on your local computer or file directory. I do recommend running a partial of your script on your local machine and making sure the process looks great before submitting your task through cluster.

# Instructions
## Create COE HPC Account
Since we are not College of Engineering students, we need to request an account from [HPC administration](https://it.engineering.oregonstate.edu/hpc).

* ![request an account on HPC page](CreatAccount.png)
