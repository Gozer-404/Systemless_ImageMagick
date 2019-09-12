##########################################################################################
#
# Magisk Module UnInstaller Script
#
##########################################################################################

# echo before loading util_functions
ui_print() { echo "$1"; }

require_new_magisk() {
  ui_print "***********************************"
  ui_print " Please install the latest Magisk! "
  ui_print "***********************************"
  exit 1
}

print_modname() {
  ui_print "************************************"
  ui_print "         ImageMagick-7              "
  ui_print " Systemless ImageMagick UnInstaller "
  ui_print "         By: Gozer404               "
  ui_print "************************************"
}

on_uninstall() {
  ui_print "- removing links in $MODPATH"
  # SPECIFIC: remove the symbolic links
  rm -f $MODPATH/system/usr/bin/magick
  rm -f $MODPATH/system/usr/lib/libc++_shared.so
}

##########################################################################################
# Environment
##########################################################################################

# Load utility functions
if [ -f /data/adb/magisk/util_functions.sh ]; then
  . /data/adb/magisk/util_functions.sh
else
  require_new_magisk
fi

print_modname

# Absolute path to this script, e.g. /data/adb/modules/Systemless_ImageMagick/uninstall.sh
SCRIPT=$(readlink -f "$0")
# Absolute path this script is in, thus /data/adb/modules/Systemless_ImageMagick
MODPATH=$(dirname "$SCRIPT")
ui_print "- uninstall script $SCRIPT"

##########################################################################################
# Action
##########################################################################################

on_uninstall
