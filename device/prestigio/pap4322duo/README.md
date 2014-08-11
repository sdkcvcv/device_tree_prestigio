pap4322duo_device_tree
====================
copy to /something/cm10/device/prestigio/pap4322duo

and setup vendor tree using ./extract-files.sh

and build commands are
 . build/envsetup.sh
 lunch pap4322duo-userdebug
 make -j5 bacon
