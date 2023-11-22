# Wiz Secure Cloud Development Demo Repository

WizCLI helps shift security policies left by empowering DevOps to prevent insecure resources from being deployed.

## Description

This repository supports demonstrating Secure Cloud Development features of Wiz.

## Configuration

* Create a [Wiz Service Account](https://docs.wiz.io/wiz-docs/docs/service-accounts-settings) with `create:security_scans` and `update:security_scans` permissions
* Use this template to copy this repository into your own GitHub namespace
* Create `WIZ_CLIENT_ID` and `WIZ_CLIENT_SECRET` [secrets](https://docs.github.com/en/actions/security-guides/using-secrets-in-github-actions) in your repository
* Run the `WizCLI IaC Scan` GitHub Action once to register it for use in Branch Protection.
    * Navigate to `Actions > wiz-iac-scan`
    * Select `Run Workflow`
* Configure Branch Protection for the `main` branch
    * Navigate to `Settings > Code and Automation > Branches`
    * Check `Require a pull request before merging`
    * Check `Require status checks to pass before merging`
    * Search for and select the `WizCLI IaC Scan` GitHub Action
    * Save Changes

## Usage

Use your copy of this repository:

* Create an new branch in your repository
* Edit `terraform/aws/example.tf` changing `versioning { enabled = true }` to `false`
* Commit your change
* Push your branch to your repository
* Create a pull request from your branch
* Review the results in GitHub (navigate to `Pull Requests` or `Actions`)
* Review the results in the Wiz Console (navigate to `Reports > CI/CD Scans`)

## Notes

This repository includes additional Terraform examples, taken from the cloud provider documentation in the Terraform Registry. 
To enable them, edit the [WizCLI IaC Scan](.github/workflows/wiz-iac-scan.yaml) GitHub Action.

This repository includes a Docker Image example.
To enable that, add the [WizCLI Image Scan](.github/workflows/wiz-image-scan.yaml) GitHub Action to your Branch Protection Status Checks.

This repository depends upon the [SecCloudDev-Demo](https://app.wiz.io/policies/cicd-policies#~(filters~(search~(contains~'SecCloudDev-Demo)))) CI/CD Policies
and the [SecCloudDev Demo for S3](https://app.wiz.io/settings/security-frameworks#~(filters~(search~(contains~'SecCloudDev*20Demo)))) Compliance Framework.
