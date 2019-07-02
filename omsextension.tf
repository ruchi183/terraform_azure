/*resource "azurerm_virtual_machine_extension" "demo" {
    count = 3
    name = "MicrosoftMonitoringAgent"
    location = "${azurerm_resource_group.demo.location}"
    resource_group_name = "${azurerm_resource_group.demo.name}"
    virtual_machine_name = "${element(azurerm_virtual_machine.demo.*.name,count.index)}"
    publisher = "Microsoft.EnterpriseCloud.Monitoring"
    type = "MicrosoftMonitoringAgent"
    type_handler_version = "1.0"
    auto_upgrade_minor_version = "True"

 settings = <<-BASE_SETTINGS
 {
   "workspaceId" : "xxxxx"
 }
 BASE_SETTINGS

 protected_settings = <<-PROTECTED_SETTINGS
 {
   "workspaceKey" : "${var.omskey}"
 }
 PROTECTED_SETTINGS
}*/