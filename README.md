# terraform_azure
This terraform script prepared to create multiple azure VM in single terraform apply. We need to provide the count variable based on number of VM needs to create.
The script is created using service principle for Azure authentication.
1. Create a service place in azure subscription.
2. vnet.tf will create 3 virtual networks in East US location(default location)
3. nic.tf will create 3 network interfaces with static private ip address assiged to it.
4. storageaccount.tf - will create storage account to store vhd files for virtual machine. if we want to provision server with unmanaged disk.
5. virtualmachine.tf - will create 3 VM as per provided names in "vm_name" variable  in terraform.tfvars with unmanaged disk data disks.
6. oms_worspace.tf - this will create log analytics workspace for cetralized log monitoring.
7. omsextension.tf - will install oms extension on server with above workspace id.
8. vmextension_domainjoin.tf - will join all the servers to domain.

