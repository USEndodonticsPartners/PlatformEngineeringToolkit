# Platform Engineering Toolkit

Welcome to the **Platform Engineering Toolkit**, a comprehensive collection of Terraform modules designed to streamline cloud infrastructure deployment and management on **Microsoft Azure**. This toolkit enables platform engineers and DevOps teams to implement infrastructure-as-code (IaC) best practices, ensuring scalability, security, and maintainability.

## Available Azure Terraform Modules
Below is a list of currently available Terraform modules in the Platform Engineering Toolkit:

## Azure Infrastructure Terraform Modules
### Governance Modules
- **Azure Resource Group** - [ReadMe](./AzureInstructure/Governance/resource-group/README.md)

### Connectivity Modules
- **Azure Virtual Network (VNet)** - [ReadMe](./AzureInstructure/Connectivity/virtual_network/README.md)
- **Azure Network Security Group (NSG)** - [ReadMe](./AzureInstructure/Connectivity/network_security/README.md)
- **Azure Network Interface (NIC)** - [ReadMe](./AzureInstructure/Connectivity/network_interface/README.md)
- **Azure Public IP Address (PIP)** - [ReadMe](./AzureInstructure/Connectivity/public_ip/README.md)
- **Azure Route Table (RT)** - [ReadMe](./AzureInstructure/Connectivity/route_table/README.md)
- **Azure Virtual Peering (VP)** - [ReadMe](./AzureInstructure/Connectivity/vnet_peering/README.md)

---

### Storage Modules
- **Azure Storage Account (SA)** - [ReadMe](./AzureInstructure/Storage/storage_account/README.md)
- **Azure Managed Disk** - [ReadMe](./AzureInstructure/Storage/managed_disk/README.md)

---

### Security Modules
- **Azure Key Vault (AKV)** - [ReadMe](./AzureInstructure/Security/key_vault/README.md)

---

### Compute Modules
- **Azure Bastion Host** - [ReadMe](./AzureInstructure/Compute/bastion_host/README.md)
- **Azure Virtual Desktop (AVD)** - [ReadMe](./AzureInstructure/Compute/virtual_desktop/README.md)
- **Azure Windows Virtual Machine (VM)** - [ReadMe](./AzureInstructure/Compute/virtual_machine/windows/README.md)

---

## Upcoming Azure Terraform Modules
The following modules are under development and will be available soon:
- **Azure Web Application Firewall (WAF)**
- **Azure Firewall**
- **Azure VPN Gateway**
- **Azure Managed Identity**
- **Azure Monitor**
- **Azure Log Analytics Workspace**
- **Azure Private Endpoint**
- **Azure Policy Assignment**
- **Azure Role Assignment**

## Getting Started
To get started with the Platform Engineering Toolkit, clone the repository and follow the instructions provided in each module's ReadMe file.

```sh
# Clone the repository
git clone https://github.com/your-org/platform-engineering-toolkit.git
cd platform-engineering-toolkit
```

For specific module usage, navigate to the respective module directory and refer to its **ReadMe**.

## Contributing
We welcome contributions! If you have suggestions, bug reports, or would like to add new modules, please submit a pull request following our [Contribution Guidelines](./CONTRIBUTING.md).

## License
This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.

## Support
For support and discussions, open an issue in the repository or reach out to the platform engineering team.

Happy coding! 🚀
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
