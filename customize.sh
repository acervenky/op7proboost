mkdir -p $MODPATH/system/vendor/etc
ui_print "OnePlus 7 Pro Volume Boost Mod"
cp -f /system/vendor/etc/mixer_paths_tasha.xml $MODPATH/system/vendor/etc/mixer_paths_tasha.xml
. $MODPATH/.aml.sh
ui_print "Installed!"
ui_print "By acervenky@XDA"

set_perm_recursive $MODPATH 0 0 0755 0644
