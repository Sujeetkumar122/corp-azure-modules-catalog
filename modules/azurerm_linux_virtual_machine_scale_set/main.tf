resource "azurerm_linux_virtual_machine_scale_set" "vmss" {
  for_each = var.scale_sets

  name                            = each.value.name
  resource_group_name             = each.value.resource_group_name
  location                        = each.value.location
  sku                             = each.value.sku
  instances                       = try(each.value.instances, 2)
  admin_username                  = each.value.admin_username
  admin_password                  = each.value.admin_password
  disable_password_authentication = false

  source_image_reference {
    publisher = try(each.value.image_publisher, "Canonical")
    offer     = try(each.value.image_offer, "0001-com-ubuntu-server-jammy")
    sku       = try(each.value.image_sku, "22_04-lts")
    version   = try(each.value.image_version, "latest")
  }

  os_disk {
    storage_account_type = try(each.value.storage_account_type, "Standard_LRS")
    caching              = try(each.value.os_disk_caching, "ReadWrite")
  }

  network_interface {
    name    = "${each.value.name}-nic"
    primary = true

    ip_configuration {
      name                                   = "internal"
      primary                                = true
      subnet_id                              = each.value.subnet_id
      load_balancer_backend_address_pool_ids = try(each.value.backend_address_pool_ids, [])
    }
  }

  tags = try(each.value.tags, {})
}
