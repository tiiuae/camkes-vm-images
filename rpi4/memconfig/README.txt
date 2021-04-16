These files were extracted from a running Raspbian instance
with various different configurations in boot partition 'config.txt' file.

LEGEND

'disablebt'   > 'dtoverlay=disable-bt'
'miniuart-bt' > 'dtoverlay=miniuart-bt'
'uart2'       > 'dtoverlay=uart2'
'gpumem128'   > 'gpu_mem=128'
'gpumem64'    > 'gpu_mem=64'

EXTRACT COMMANDS

DTS   : 'dtc -I fs -O dts -o filename.dts /proc/device-tree'
IOMEM : 'sudo cat /proc/iomem > filename-iomem'
