resource "azurerm_app_service_plan" "asp" {
  name                = "terra-cloud-app-service-plan-via-semaphore"
  location            = data.azurerm_resource_group.existing_rg.location
  resource_group_name = data.azurerm_resource_group.existing_rg.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Basic"
    size = "B1"
  }
}

resource "azurerm_linux_web_app" "app" {
  name                = "terra-cloud-paas-via-semaphore"
  location            = data.azurerm_resource_group.existing_rg.location
  resource_group_name = data.azurerm_resource_group.existing_rg.name
  service_plan_id     = azurerm_app_service_plan.asp.id

  site_config {
    linux_fx_version = "PHP|8.2"
  }

  app_settings = {
    "APP_ENV"       = var.APP_ENV
    "APP_KEY"       = var.APP_KEY
    "DB_CONNECTION" = var.DB_CONNECTION
    "DB_HOST"       = var.DB_HOST
    "DB_PORT"       = var.DB_PORT
    "DB_DATABASE"   = var.DB_DATABASE
    "DB_USERNAME"   = var.DB_USERNAME
    "DB_PASSWORD"   = var.DB_PASSWORD
  }
}

