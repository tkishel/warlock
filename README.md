# Resources for demonstrating the scanning of templates and images with Wiz

WizCLI helps shift security policies left by empowering DevOps to prevent insecure resources from being deployed.

Moreover, WizCLI scales effortlessly, empowering enforcement of security policies across organizations.

## Configuration

Configure a copy of this repository:

* Create a Wiz Service Account with `create:security_scans` permissions (do not use the Demo tenant).
* Clone this repository.
* Create `WIZ_CLIENT_ID` and `WIZ_CLIENT_SECRET` secrets in your repository.

## Usage

Use your copy of repository:

* Create an arbitrary branch in your repository.
* Make an arbitrary change to one of the templates or images.
* Commit the change.
* Push the commit to your repository.

Review the results in GitHub and the Wiz Console (Reports > CI/CD Scans).

## Notes

The IAC resources in this repository represent the simplest examples, taken from cloud provider documentation in the Terraform Registry.
