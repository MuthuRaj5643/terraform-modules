module "test_landing_bucket" {
  source        = "github.com/terraform-google-modules/cloud-foundation-fabric//modules/gcs?ref=v5.1.0"
  project_id    = var.project_id
  name          = "${var.project_id}-landing-sfdc"
  storage_class = "REGIONAL"
  location      = "us-central1"
  versioning    = true
  force_destroy = false
  labels        = var.storage_bucket_labels
}

resource "google_storage_bucket_object" "object" {
  name   = var.object_name
  bucket = module.test_landing_bucket.name
  source = var.object_source
}

resource "google_app_engine_standard_app_version" "myapp_v1" {
  version_id = "v1"
  service    = "default"
  runtime    = "python27"

  entrypoint {
    shell = "python ./main.py"
  }

  deployment {
    zip {
      source_url = "https://storage.googleapis.com/${module.test_landing_bucket.name}/${google_storage_bucket_object.object.name}"
    }
  }

  env_variables = {
    port = "8080"
  }

  automatic_scaling {
    max_concurrent_requests = 10
    min_idle_instances = 1
    max_idle_instances = 3
    min_pending_latency = "1s"
    max_pending_latency = "5s"
    standard_scheduler_settings {
      target_cpu_utilization = 0.5
      target_throughput_utilization = 0.75
      min_instances = 2
      max_instances = 10
    }
  }

  delete_service_on_destroy = true

  depends_on = [ module.test_landing_bucket , google_storage_bucket_object.object ]
}

resource "google_app_engine_standard_app_version" "myapp_v2" {
  version_id = "v2"
  service    = "myapp"
  runtime    = "python27"

  entrypoint {
    shell = "python ./main.py"
  }

  deployment {
    zip {
      source_url = "https://storage.googleapis.com/${module.test_landing_bucket.name}/${google_storage_bucket_object.object.name}"
    }
  }

  env_variables = {
    port = "8080"
  }

  basic_scaling {
    max_instances = 5
  }

  noop_on_destroy = true
}