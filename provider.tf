# trunk-ignore(tflint/terraform_required_version)
terraform {
  backend "azurerm" {
    resource_group_name  = "rg-india"  # Can also be set via `ARM_CLIENT_ID` environment variable.
    storage_account_name = "stgindia"                              # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "tfstate"                               # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "terraform.tfstate"                # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.46.0"
    }
  }
}

provider "azurerm" {
  features {
  }
  subscription_id = "85bce315-2d40-4002-a3d1-b7f28202855c"

}
