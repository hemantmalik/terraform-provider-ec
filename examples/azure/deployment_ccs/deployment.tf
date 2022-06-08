terraform {
  required_version = ">= 0.12.29"

  required_providers {
    ec = {
      source  = "elastic/ec"
      version = "0.5.0"
    }
  }
}

provider "ec" {}

# Retrieve the latest stack pack version
data "ec_stack" "latest" {
  version_regex = "latest"
  region        = "azure-eastus"
}

resource "ec_deployment" "source_deployment" {
  name = "my_source_ccs"

  region                 = "azure-eastus"
  version                = data.ec_stack.latest.version
  deployment_template_id = "azure-storage-optimized"

  elasticsearch {
    topology {
      id         = "hot_content"
      zone_count = 1
      size       = "2g"
    }
  }
}

resource "ec_deployment" "second_source" {
  name = "my_second_source_source_ccs"

  region                 = "azure-eastus"
  version                = data.ec_stack.latest.version
  deployment_template_id = "azure-storage-optimized"

  elasticsearch {
    topology {
      id         = "hot_content"
      zone_count = 1
      size       = "2g"
    }
    remote_cluster {
      deployment_id = ec_deployment.source_deployment.id
      alias         = ec_deployment.source_deployment.name
      ref_id        = ec_deployment.source_deployment.elasticsearch.0.ref_id
    }
  }

  kibana {}
}