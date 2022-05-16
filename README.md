# Terraform
Modules for Terraform with tests and Pipeline definitions
| Status |
|:--:|
|[![Board Status](https://dev.azure.com/wesleytrust/e877378a-4a78-460d-bcc8-36cef3decd0e/4f6e88ab-5c49-41c2-94c2-7429981e9a8a/_apis/work/boardbadge/928ae330-92c8-4f3e-8f73-2692da0ab73a?columnOptions=1)](https://dev.azure.com/wesleytrust/e877378a-4a78-460d-bcc8-36cef3decd0e/_boards/board/t/4f6e88ab-5c49-41c2-94c2-7429981e9a8a/Microsoft.EpicCategory/)|

## Modules
### Deployments
| Parent Module           | Unit Tests | Integration Tests | Required Dependencies                                        | Optional Dependencies         |
| :---------------------- | :--------: | :---------------: | :----------------------------------------------------------- | :---------------------------- |
| Resource_group          |            |                   |                                                              |
| Network_peering         |            |                   |                                                              |
| Static_site             |            |                   | Resource_group                                               |
| Traffic_manager         |            |                   | Resource_group                                               |
| Storage_sync            |            |                   | Resource_group                                               |
| Recovery_services       |            |                   | Resource_group                                               |
| Windows_virtual_machine |            |                   | Resource_group<br>Key_vault<br>Network<br>Network_interfaces | Disks<br>Public_load_balancer |
| Linux_virtual_machine   |            |                   | Resource_group<br>Key_vault<br>Network<br>Network_interfaces | Disks<br>Public_load_balancer |

### Resources
| Child Module         |
| :------------------- |
| Disks                |
| Key_vault            |
| Network              |
| Network_interfaces   |
| Public_load_balancer |

