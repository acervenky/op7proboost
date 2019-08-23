RUNONCE=true

patch_mixer_toplevel() {
  case $1 in
    -c) if [ "$(grep "<ctl name=\"$2\" value=\".*\" />" $MODPATH/system/vendor/etc/mixer_paths_tavil.xml)" ]; then
          local num=$(sed -n "/<ctl name=\"$2\" value=\".*\" \/>/=" $MODPATH/system/vendor/etc/mixer_paths_tavil.xml | head -n1)
          sed -i "$num s/\(<ctl name=\"$2\" value=\"\).*\(\" \/>\)/\1$3\2/" $MODPATH/system/vendor/etc/mixer_paths_tavil.xml
        fi;;
    -p) if [ "$(sed -n "/ *<path name=\"$2\">/,/ *<\/path>/ {/<ctl name=\"$3\" value=\".*\" \/>/p}" $MODPATH/system/vendor/etc/mixer_paths_tavil.xml)" ]; then
          sed -i "/ *<path name=\"$2\">/,/ *<\/path>/ s/\(<ctl name=\"$3\" value=\".*\" \/>\)/\1\n        <ctl name=\"$4\" value=\"$5\" \/>/" $MODPATH/system/vendor/etc/mixer_paths_tavil.xml
        fi;;
  esac
}

patch_mixer_toplevel -c "HPHL Volume" "25"
patch_mixer_toplevel -c "HPHR Volume" "25"
patch_mixer_toplevel -c "RX0 Digital Volume" "90"
patch_mixer_toplevel -c "RX1 Digital Volume" "90"
patch_mixer_toplevel -c "RX2 Digital Volume" "90"
patch_mixer_toplevel -c "RX3 Digital Volume" "90"
patch_mixer_toplevel -c "RX4 Digital Volume" "90"
patch_mixer_toplevel -c "RX5 Digital Volume" "90"
patch_mixer_toplevel -c "RX6 Digital Volume" "90"
patch_mixer_toplevel -c "RX7 Digital Volume" "90"

