terraform {
  required_providers {
    port = {
      source  = "port-labs/port-labs"
      version = "~> 1.0.0"
    }
  }
}

variable "PORT_CLIENT_ID" {}
variable "PORT_CLIENT_SECRET" {}

provider "port" {
  client_id = var.PORT_CLIENT_ID     # or set the environment variable PORT_CLIENT_ID
  secret    = var.PORT_CLIENT_SECRET # or set the environment variable PORT_CLIENT_SECRET
}

resource "port_blueprint" "tf-test" {
  identifier = "tf-test"
  icon       = "Bucket"
  title      = "Test from Terraform"

  properties = {
    boolean_props = {
      isTF = {
        title      = "Is from terraform?"
        required   = false
      }
    }
  }
    relations = {
      mySingleRelationToRepo = {
        target   = "service"
        title    = "Related Repo"
        required = true
        many     = false
      }
    }
}

resource "port_entity" "myEntity" {
  identifier = "tfEntity" # Entity identifier
  title      = "My TF Entity" # Entity title
  blueprint  = "tf-test" # Identifier of the blueprint to create this entity from

  properties = {
    boolean_props = {
      "isTF" = true
      }
  }
  relations = {
    single_relations = {
    "mySingleRelationToRepo" = "port-test"
    }
  }
}