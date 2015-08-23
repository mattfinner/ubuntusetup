#!/bin/bash
# arg 1 == VM name
# arg 2 == Datastore path

mkdir $2/$1

echo '.encoding = "UTF-8"
config.version = "8"
virtualHW.version = "8"
pciBridge0.present = "TRUE"
svga.present = "TRUE"
pciBridge4.present = "TRUE"
pciBridge4.virtualDev = "pcieRootPort"
pciBridge4.functions = "8"
pciBridge5.present = "TRUE"
pciBridge5.virtualDev = "pcieRootPort"
pciBridge5.functions = "8"
pciBridge6.present = "TRUE"
pciBridge6.virtualDev = "pcieRootPort"
pciBridge6.functions = "8"
pciBridge7.present = "TRUE"
pciBridge7.virtualDev = "pcieRootPort"
pciBridge7.functions = "8"
vmci0.present = "TRUE"
hpet0.present = "TRUE"
displayName = "'$1'"
virtualHW.productCompatibility = "hosted"
numvcpus = "4"
memSize = "8192"
scsi0.virtualDev = "lsilogic"
scsi0.present = "TRUE"
ide1:0.deviceType = "atapi-cdrom"
ide1:0.fileName = "emptyBackingString"
ide1:0.present = "TRUE"
floppy0.startConnected = "FALSE"
floppy0.clientDevice = "TRUE"
floppy0.fileName = "vmware-null-remote-floppy"
ethernet0.virtualDev = "vmxnet3"
ethernet0.networkName = "VM Network"
ethernet0.addressType = "generated"
ethernet0.present = "TRUE"
scsi0:0.deviceType = "scsi-hardDisk"
scsi0:0.fileName = "'$1'.vmdk"
scsi0:0.present = "TRUE"
guestOS = "ubuntu-64"
toolScripts.afterPowerOn = "TRUE"
toolScripts.afterResume = "TRUE"
toolScripts.beforeSuspend = "TRUE"
toolScripts.beforePowerOff = "TRUE"' > $2/$1/$1.vmx

vmkfstools -i /vmfs/volumes/VMHOST_DS2/TEMPLATES/TEMPLATE_UBUNTU_SERVER_14_04_LTS.vmdk $2/$1/$1.vmdk -d thin

vim-cmd solo/registervm $2/$1/$1.vmx
