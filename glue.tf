resource "aws_glue_catalog_database" "aws_glue_catalog_database" {
  name = "MyCatalogDatabase"
}
resource "aws_glue_catalog_table" "aws_glue_catalog_table" {
  name          = "MyCatalogTable"
  database_name = "MyCatalogDatabase"
}