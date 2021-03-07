# oci-theia-tf

Purpose: Terraform Project for oci-theia

This project has the main "outcome" and configuration.

Head to the following link if you are interested in the project itself - https://github.com/jlowe000/oci-theia

## oci-theia background (replicated from the #oci-theia README)

This was created to demonstrate a few things about Oracle Cloud Infrastructure in a "fun" way. There are different elements of the OCI that have been exercised that will be discussed here.

This borrows an open-source development environment to work with.

- Theia - https://theia-ide.org
- Theia (Docker) - https://hub.docker.com/u/theiaide
- Theia with Python (Docker) - https://hub.docker.com/r/theiaide/theia-python

## Pre-Requisites

- Need an OCI Tenancy and this is built with a Always-Free Tier account in mind. However, has been deployed into another type of tenancy / compartment with limited access policies.
- Need an administrator access to the account (keeping it simple).

## 1. Prepare for running the Oracle Resource Manager Stack

- Create a compartment (and note the OCID)
- Note your tenancy namespace and OCID
- Know which region you are deploying into
- Know which compute shape and source-image to deploy compute
- Create a SSH Key (ie using puttygen or ssh-keygen)
- Define a user and password for Theia

### Here are some references to help with filling in this information from your tenancy

- The source-image-id was based upon an Oracle-Linux-7.8 image - here are the OCIDs for this image (which is different for each region) - defaulted to the au-sydney-1 region - https://docs.oracle.com/en-us/iaas/images/image/f54bf63c-a3a7-46d0-bccf-6bacf6815994/
- The SSH key is a common element to infrastructure so you can log into the compute - use ie puttygen or ssh-keygen - https://docs.oracle.com/en-us/iaas/Content/Compute/Tasks/managingkeypairs.htm#Managing_Key_Pairs_on_Linux_Instances
- The compute shape is used for the VM hosting the APIs as well as Oracle Functions (on docker). You can find out the different shapes here (VM.Standard.E2.1.Micro is the only shape available as part of the Always-Free Tier) - https://docs.oracle.com/en-us/iaas/Content/Compute/References/computeshapes.htm

## 2. Run the ORM and create a stack using the directory tf-arcade as the source

- Provide the details above into the script
- The outcome will be:
  - A VCN
  - A compute instance
  - Deploy a nginx docker image to help with securing Theia (as it doesn't have authentication). Currently using basic-auth.
  - Deploy a theia-python docker image
- The output variables will have:
  - A template to login into the compute via ssh
  - The public IP address of the compute
  - Theia URL (:8080 for http and :8081 for https)
- Note:
  - In an Always-Free Tier, you make get issues when you "Apply" because (these are the common ones I found):
    - There can only be a single VCN allowed in the tenancy.
    - There can only be 2 x VM instances and 2 x Autonomous Database instances.
  - Need to "accept" exception in browser for the API calls (https://<compute-public-ip>:8081) - Without this step, API calls from game will fail with CERT exception

