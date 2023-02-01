#
## BANCO AV VILLAS
## COMPONENTE: bavv-gi-cloud-terraform-azure-vm
## VERSIÓN: 0.0.1.0
#

# Introducción
El presente componente define el módulo de implemetación de máquinas virtuales en azure. A continuación, se describe la estructura y comandos de mantenimiento.

## Estructura
El componente dispone de la siguiente estructura:
```
|- addon: define los elemetos de adición
    |-  module-nsg: define grupos de seguridad en la red
    |-  module-public-ip: define ip publicas
    |-  module-red-hat: define una máquina virtual con sistema operativo RedHat
    |-  module-rg: define grupos de recursos
    |-  module-vnet: define redes virtuales
    |-  module-windows: define una máquina virtual con sistema operativo Windows
|- pipelines: Define los pipelines que exponen los servicios del módulo
```

## Comandos
- Para verificar el código
```
terraform fmt -recursive
```
- Para generar un plan desde archivo de confuguración
```
terraform plan -var-file infrastructure/pre.auto.tfvars.json -out main.tfplan
```
- Para aplicar un plan desde archivo de confuguración
```
terraform apply -var-file infrastructure/pre.auto.tfvars.json -auto-approve 
```
- Para actualizar el provider lib
```
terraform init -upgrade
```
- Para eliminar todos los recursos
```
terraform apply -destroy -var-file infrastructure/ws.auto.tfvars.json
```
- Ejemplo de creación de una máquina virtual con sistema operativo con hardering.
```
terraform apply -destroy -var-file infrastructure/red_hat_vm.auto.tfvars.json
```