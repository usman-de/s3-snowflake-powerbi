# Automated Data Pipeline: S3 to Snowflake to Power BI

This repository sets up an end-to-end automated pipeline for loading data from S3 into Snowflake, transforming it, and visualizing it in Power BI. The entire pipeline is automated with Terraform, GitHub Actions, and other necessary components.

## Progress Overview

### 1. **Terraform Setup for AWS Infrastructure**
   - **S3 Bucket**: Set up an S3 bucket to store TF state file.
   - **DynamoDB Table**: Created a DynamoDB table for state locking, ensuring safe and concurrent Terraform operations.
   - **Backend Configuration**: Configured Terraform to use S3 for storing the state and DynamoDB for state locking.

### 2. **CI/CD Pipeline with GitHub Actions**
   - **Terraform Automation**: Created a GitHub Actions workflow that:
     - Runs `terraform validate and plan` on every push to the `main` or `master` branch if there's a change in terraform folder.
     - Runs `terraform apply` on completion of `terraform validate and plan` action.

### 3. **Loading Data into S3**

To load data into your S3 bucket, we use the following command to sync data from the OpenAlex authors dataset to your own S3 bucket:

```bash
aws s3 sync s3://openalex/data/authors s3://bucket-name/key --exclude 'manifest'
```

**About OpenAlex**: OpenAlex is a comprehensive open-source dataset of academic works, authors, institutions, and other scholarly metadata. It contains detailed information on millions of authors, papers, and citations.

**Note on Raw Data**: The raw data from OpenAlex can be quite messy and complex to work with due to its large scale and diverse formats.

## How to Use

1. **Modify Terraform Configuration**:
   - Update the `01_main.tf` file in the `terraform` folder with your unique S3 bucket name and DynamoDB table name.
   - Update the local variable `test_s3_bucket` in `02_local.tf` file.