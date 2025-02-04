locals {
  environments = {
    DevTest     = "devtest"
    Development = "dev"
    Testing     = "test"
    Production  = "prod"
    Vendor      = "ven"
  }

  azure_locations = {
    EastUS          = "eastus"
    EastUS_2        = "eastus2"
    Central_US      = "centralus"
    North_CentralUS = "northcentralus"
    South_CentralUS = "southcentralus"
    WestUS          = "westus"
    WestUS_2        = "westus2"
    WestUS_3        = "westus3"
  }

  prefix_locations = {
    EastUS          = "use"
    EastUS_2        = "use2"
    Central_US      = "usc"
    North_CentralUS = "usnc"
    South_CentralUS = "ussc"
    WestUS          = "usw"
    WestUS_2        = "usw2"
    WestUS_3        = "usw3"
  }
}
+
