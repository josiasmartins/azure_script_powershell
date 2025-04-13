# Create VM Windows
az vm create --resource-group "web-grp" --name "appvm" --image Win2022Datacenter --admin-username "appadmin"
# Create VM ubuntus
az vm create --resource-group "web-grp" --name "linuxvm" --image "Canonical:0001-com-ubuntu-server-jammy:22_04-lts-gen2:latest" --admin-username "linuxadmin" --admin-password "Josiasmartins@99"