resource azurerm_storage_account demo{
    name = "sa1"
    resource_group_name = "${azurerm_resource_group.demo.name}"
    location = "${azurerm_resource_group.demo.location}"
    account_tier = "Standard"
    account_replication_type = "LRS"
}

resource azurerm_storage_container demo{
    name = "vhds"
    resource_group_name = "${azurerm_resource_group.demo.name}"
    storage_account_name = "${azurerm_storage_account.demo.name}"
    container_access_type = "private"
}