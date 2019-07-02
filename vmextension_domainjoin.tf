resource "azurerm_virtual_machine_extension" "demo1" {
    count = 2
    name                 = "join-domain"
    location             = "${var.location}"
    resource_group_name  = "${var.vm_resource_group_name}"
    virtual_machine_name = "${element(var.vm_name,count.index)}"
    publisher            = "Microsoft.Compute"
    type                 = "JsonADDomainExtension"
    type_handler_version = "1.0"

    settings = <<SETTINGS
    {
        "Name": "domain.local",
        "OUPath": "",
        "User": "domain\\user"
        "Restart": "true",
        "Options": "3"
    }
    SETTINGS

    protected_settings = <<PROTECTED_SETTINGS
    {
        "Password": "xxxxxx"
    }
    PROTECTED_SETTINGS
}

