resource azurerm_network_interface demo{
    count = 3
    name = "nic${element(var.vm_name,count.index)}"
    location = "${var.location}"
    resource_group_name = "${azurerm_resource_group.demo.name}"

    ip_configuration{
        name = "ipconfig1"
        subnet_id = "${var.subnet_id}"
        private_ip_address_allocation = "static"
        private_ip_address = "${element(var.private_ip,count.index)}"
    }
}