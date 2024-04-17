resource "aws_dynamodb_table" "tbl_products" {
  name         = var.name_dynamodb
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"
  attribute {
    name = "id"
    type = "N"
  }
  tags = var.common_tag
}

resource "aws_dynamodb_table_item" "main" {
  table_name = aws_dynamodb_table.tbl_products.name
  for_each   = { for idx, item in var.items : idx => item }
  hash_key = "id"
    item = <<ITEM
  {
      "id"       : {"N": "${each.value.id}"},
      "itemName" : {"S": "${each.value.itemName}"},
      "itemImage" : {"S": "${each.value.itemImage}"},
      "itemPrice" : {"N": "${each.value.itemPrice}"},
      "itemStock" : {"N": "${each.value.itemStock}"},
      "itemDesc" : {"S": "${each.value.itemDesc}"}
  }
  ITEM
}