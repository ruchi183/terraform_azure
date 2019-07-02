resource azurerm_resource_group demo {
    name = "rg"
    location = "${var.location}"    
}

resource azurerm_virtual_network demo {
    count = 3
    name = "${element(var.vnet_name,count.index)}"
    location = "${var.location}"
    resource_group_name = "${azurerm_resource_group.demo.name}"
    address_space = ["${var.address_space}"]
    dns_servers = ["xx.x.x.x"]

    subnet{
        name = "${element(var.subnet_name,count.index)}"
        address_prefix = "${var.address_space}"
    }
}