```sh
📂 ELOMiddleware/
├── 📝 .gitignore
├── 📝 locals.tf                           # Environment‑specific maps
├── 📝 provider.tf                         # Terraform & Azure provider config
├── 📝 resource_group.tf                   # Resource groups

├── 📝 access_management.tf
├── 📝 aks.tf                              # AKS cluster + node pools
├── 📝 application_gateway.tf              # (optional) Application Gateway
├── 📝 container_registry.tf               # Azure Container Registry
├── 📝 cosmosdb.tf                         # Cosmos DB (Mongo API / SQL)
├── 📝 customdata.tpl
├── 📝 datafactory.tf                      # Azure Data Factory
├── 📝 databricks.tf                       # Azure Databricks workspace
├── 📝 datalake.tf                         # Data Lake Storage Gen2
├── 📝 diagnostics.tf                      # Diagnostic settings for all resources
├── 📝 disaster_recovery.tf                # Site Recovery vault & replication
├── 📝 firewall.tf                         # Azure Firewall + policies
├── 📝 front_door.tf                       # Azure Front Door
├── 📝 key_vault.tf
├── 📝 key_vault_db_secrets.tf
├── 📝 key_vault_secrets.tf
├── 📝 log_datacollections.tf
├── 📝 logmonitor.tf                       # Log Analytics & Application Insights
├── 📝 machine_learning.tf                 # Azure Machine Learning workspace
├── 📝 network.tf                          # VNet, subnets, NSG, peering
├── 📝 postgres.tf                         # Azure Database for PostgreSQL
├── 📝 private_endpoints.tf                # Private endpoints for PaaS services
├── 📝 redis.tf                            # Azure Cache for Redis
├── 📝 role_assignments.tf                 # RBAC assignments (optional)
├── 📝 security_group.tf                   # NSG rules (if not in network.tf)
├── 📝 servicebus.tf                       # Azure Service Bus
├── 📝 sftp_storage.tf                     # Storage account with SFTP endpoint
├── 📝 signalr.tf                          # Azure SignalR Service
└── 📝 variables.tf                        # Input variables (including environment)
```