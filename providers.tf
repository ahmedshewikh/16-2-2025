#-----------------------------------------------------------------------------------------------------------------------------
terraform {
  required_version = ">=1.3.0"
  required_providers {
    azurerm = {
      "source" = "hashicorp/azurerm"
      version  = "3.43.0"
    }
  }
}

#Must create new workspace on HCP as everytime I start with a new tfstate 
#or search for how to delete old state if I want to work on the same workspace
/* terraform { 
  cloud { 
    
    organization = "hishamcorp" 

    workspaces { 
      name = "29janstate" 
    } 
  } 
} 
*/

provider "azurerm" {
  features {}
  skip_provider_registration = true
}
#-----------------------------------------------------------------------------------------------------------------------------



#Resource Group
#for sanboxes , should import the existing resource group also each deployment replace the resource group name before importing
#Out of sandbox if I will deplot to existing RG not in the state should be imported first also
resource "azurerm_resource_group" "rg1" {
  name     = "1-f76502c5-playground-sandbox"
  location = "South Central US"
}




#Resources----------------------------------------




