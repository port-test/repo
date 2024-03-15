terraform {
  required_providers {
    port = {
      source  = "port-labs/port-labs"
      version = "~> 1.0.0"
    }
  }
}

provider "port" {
  client_id = "{{ secrets.PORT_CLIENT_ID }}"     # or set the environment variable PORT_CLIENT_ID
  secret    = "{{ secrets.PORT_CLIENT_SECRET }}" # or set the environment variable PORT_CLIENT_SECRET
}

resource "port_entity" "myEntity" {
  identifier = "myEntity"
  title      = "My Entity"
  blueprint  = "myBlueprint"

  properties = {
    "string_props" = {
      "myStringProp" = "My string"
    }
    "number_props" = {
      "myNumberProp" = 7
    }
    "boolean_props" = {
      "myBooleanProp" = true
    }
    "object_props" = {
      "myObjectProp" = jsonencode({ "my" : "object" })
    }
    "array_props" = {
    "string_props" = {
        "myArrayProp" = ["a", "b", "c"]
      }
    }
  }
}