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