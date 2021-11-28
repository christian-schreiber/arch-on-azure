az group create --name Arch-Linux --location westeurope

az vm image list --output table

az disk create --name arch_www --resource-group Arch-Linux --size-gb 10 --sku Standard_LRS --location westeurope

az vm create --resource-group Arch-Linux --name arch_vm --os-disk-name arch_root --attach-data-disks arch_www --image Debian:debian-10:10:latest --size Standard_B1s --admin-username christian --admin-password S@rt123! --authentication-type all --computer-name arch --location westeurope --nsg-rule NONE --public-ip-sku Basic --public-ip-address-allocation static 

az network nsg rule create --resource-group Arch-Linux --nsg-name arch_vmNSG --name SSH --protocol TCP --priority 300 --destination-port-range 22 --access allow
az network nsg rule create --resource-group Arch-Linux --nsg-name arch_vmNSG --name HTTP --protocol TCP --priority 310 --destination-port-range 80 --access allow
az network nsg rule create --resource-group Arch-Linux --nsg-name arch_vmNSG --name HTTPS --protocol TCP --priority 320 --destination-port-range 443 --access allow
