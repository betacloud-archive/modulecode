resource "azurerm_virtual_network" "network" {
  name                = "${var.name}-network"
  address_space       = [var.network_address_space]
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}

resource "azurerm_subnet" "subnet" {
  name                 = "${var.name}-subnet"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.network.name
  address_prefixes     = [var.network_subnet_range]
}

resource "azurerm_public_ip" "pubinterface" {
  count = var.amount

  name                = "${var.name}-acceptanceTestPublicIp1-${count.index}"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  allocation_method   = "Static"

  tags = {
    environment = var.environment_tag
  }
}

resource "azurerm_network_interface" "nic" {
  count = var.amount

  name                = "${var.name}-nic-${count.index}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  ip_configuration {
    name                          = "primary"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    #private_ip_address_allocation = "Static"
    #private_ip_address            = "${var.network_vm_interface_ip}${count.index}"
    public_ip_address_id          = element(azurerm_public_ip.pubinterface.*.id, count.index)
  }
}
