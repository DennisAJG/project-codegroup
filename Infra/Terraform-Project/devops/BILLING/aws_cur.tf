resource "aws_cur_report_definition" "cost_report_codegroup" {
  report_name                = "terraform-cost-report"
  time_unit                  = "HOURLY"
  format                     = "textORcsv"
  compression                = "GZIP"
  s3_bucket                  = var.bucket_name_app_codegroup_dados
  s3_region                  = "us-east-1"
  s3_prefix                  = "cost-reports/"
  additional_schema_elements = ["RESOURCES"]
}

data "aws_billing_service_account" "billing_codegroup" {}

resource "aws_glue_catalog_database" "cur_database_codegroup" {
  name = "cost_and_usage_reports_codegroup"
}

resource "aws_glue_catalog_table" "cur_table_codegroup" {
  name          = "cost_usage_table"
  database_name = aws_glue_catalog_database.cur_database_codegroup.name

  table_type = "EXTERNAL_TABLE"

  parameters = {
    "classification" = "csv"
    "compressionType" = "gzip"
    "typeOfData"      = "file"
  }

  storage_descriptor {
    location      = "s3://${var.bucket_name_app_codegroup_dados}/cost-reports/"
    input_format  = "org.apache.hadoop.mapred.TextInputFormat"
    output_format = "org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat"

    ser_de_info {
      serialization_library = "org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe"
    }

    columns {
      name = "line_item_resource_id"
      type = "string"
    }

    columns {
      name = "line_item_usage_amount"
      type = "double"
    }
  }
}
