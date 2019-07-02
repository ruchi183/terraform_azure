resource azurerm_virtual_machine demo{
    count = 3
    name = "${element(var.vm_name,count.index)}"
    location = "${azurerm_resource_group.demo.location}"
    resource_group_name = "${azurerm_resource_group.demo.name}"
    network_interface_ids = ["${element(azurerm_network_interface.demo.*.id, count.index)}"]
    vm_size = "${element(var.vm_size,count.index)}"

    storage_image_reference{
        publisher = "MicrosoftWindowsServer"
        offer = "WindowsServer"
        sku = "2016-Datacenter"
        version = "latest"
    }

    storage_os_disk{
        name = "${element(var.vm_name,count.index)}-osdisk"
        vhd_uri = "https://${element(var.storage_account,count.index)}.blob.core.windows.net/vhds/${element(var.vm_name,count.index)}-osdisk.vhd"
        os_type = "Windows"
        caching = "ReadWrite"
        create_option = "FromImage"
    }

    storage_data_disk {
        name = "${element(var.vm_name,count.index)}-datadisk00"
        vhd_uri = "https://${element(var.storage_account,count.index)}.blob.core.windows.net/vhds/${element(var.vm_name,count.index)}-datadisk00.vhd"
        disk_size_gb = "10"
        create_option = "Empty"
        lun = 0
    }
    os_profile {
        computer_name = "${element(var.vm_name, count.index)}"
        admin_username = "opsadmin"
        admin_password = "${var.vm_password}"
    }

    os_profile_windows_config {
        provision_vm_agent = true
    }

    tags = {
        Environment = "Staging"
        Description = "Test"
    }

    provisioner "file" {
        source = "${var.source}"
        destination = "${var.destination}"

        connection {
            type = "winrm",
            user = "opsadmin"
            password = "welcome@12345"
        }
    }  

    provisioner "remote-exec"  {
        inline = [
            "powershell.exe -File C:\\DJ.ps1"
        ]
        connection{
            type = "winrm"
            user = "opsadmin"
            password = "welcome@12345"
        }
    }
}