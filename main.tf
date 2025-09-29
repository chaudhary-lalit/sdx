resource "azurerm_resource_group" "rg" {
  name     = "dev-rg-001"
  location = "Central India"
}

resource "azurerm_virtual_network" "vnet" {
  depends_on          = [azurerm_resource_group.rg]
  name                = "dev-vnet-001"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# resource "azurerm_subnet" "subnet" {
#   depends_on           = [azurerm_virtual_network.vnet]
#   name                 = "dev-subnet-001"
#   resource_group_name  = azurerm_resource_group.rg.name
#   virtual_network_name = azurerm_virtual_network.vnet.name
#   address_prefixes     = ["10.0.2.0/24"]
# }
# resource "azurerm_network_interface" "nic" {
#   depends_on          = [azurerm_resource_group.rg, azurerm_virtual_network.vnet, azurerm_subnet.subnet]
#   name                = "dev-nic-001"
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name

#   ip_configuration {
#     name                          = "testconfiguration1"
#     subnet_id                     = "/subscriptions/85bce315-2d40-4002-a3d1-b7f28202855c/resourceGroups/dev-rg-001/providers/Microsoft.Network/virtualNetworks/dev-vnet-001/subnets/dev-subnet-001"
#     private_ip_address_allocation = "Dynamic"
#   }
# }
# resource "azurerm_virtual_machine" "main" {
#   depends_on            = [azurerm_resource_group.rg, azurerm_network_interface.nic, azurerm_virtual_network.vnet, azurerm_subnet.subnet]
#   name                  = "dev-vm-001"
#   location              = azurerm_resource_group.rg.location
#   resource_group_name   = azurerm_resource_group.rg.name
#   network_interface_ids = ["/subscriptions/85bce315-2d40-4002-a3d1-b7f28202855c/resourceGroups/dev-rg-001/providers/Microsoft.Network/networkInterfaces/dev-nic-001"]
#   vm_size               = "Standard_DS1_v2"

#   storage_image_reference {
#     publisher = "Canonical"
#     offer     = "UbuntuServer"
#     sku       = "22_04-lts"
#     version   = "latest"
#   }
#   storage_os_disk {
#     name              = "myosdisk1"
#     caching           = "ReadWrite"
#     create_option     = "FromImage"
#     managed_disk_type = "Standard_LRS"
#   }
#   os_profile {
#     computer_name  = "hostname"
#     admin_username = "testadmin"
#     admin_password = "Password1234!"
#   }
#   os_profile_linux_config {
#     disable_password_authentication = false
#   }
#   tags = {
#     environment = "staging"
#   }
# }
