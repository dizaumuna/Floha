#!/system/bin/sh
# This project is licensed under the GPL-3.0 License. For more details, see LICENSE file.
# However, we will not include the full license text in this file, as it is already included in the LICENSE file.

ui_print "———————————————————————————————————————————————"
ui_print "            Welcome to Floha!"
ui_print "      Installation will begin shortly."
ui_print "————————————————————————————————————————————————"
sleep 3

printinfo() {
  ui_print "[Info] $1"
}

print() {
  ui_print "[/] $1"
}

printfail() {
  ui_print "[Error!] $1]"
}

debloat() {
  com.samsung.android.fast \
  com.samsung.android.ipsgeofence \
  com.samsung.android.kidsinstaller \
  com.microsoft.skydrive \
  com.samsung.android.bbc.bbcagent \
  com.samsung.android.app.spage \
  com.samsung.android.emojiupdater \
  com.sec.factory \
  com.sec.android.app.billing \
  com.samsung.android.app.omcagent \
  com.android.dreams.phototable \
  com.google.android.setupwizard \
  com.samsung.faceservice \
  com.samsung.android.coldwalletservice \
  com.sec.android.diagmonagent \
  com.wssyncmldm \
  com.samsung.android.mdm \
  com.sec.android.app.ve.vebgm \
  com.samsung.android.app.separation \
  com.amazon.appmanager \
  com.samsung.android.mapsagent \
  com.samsung.android.app.earphonetypec \
  com.google.android.feedback \
  com.android.bookmarkprovider \
  com.google.mainline.telemetry \
  com.facebook.services \
  com.facebook.appmanager \
  com.samsung.android.spaymini \
  com.dsi.ant.server \
  com.samsung.knox.keychain \
  com.sec.android.app.factorykeystring \
  com.snap.camerakit.plugin.v1 \
  com.sec.android.widgetapp.webmanual \
  com.sec.android.soagent \
  com.samsung.android.securitylogagent \
  com.samsung.android.samsungpassautofill \
  com.sec.android.app.chromecustomizations \
  com.aura.oobe.samsung.gl \
  com.samsung.android.app.updatecenter \
  com.sec.android.app.parser \
  com.android.internal.display.cutout.emulation.waterfall \
  com.google.android.onetimeinitializer \
  com.sec.android.widgetapp.easymodecontactswidget \
  com.sec.enterprise.knox.cloudmdm.smdms \
  com.samsung.android.knox.analytics.uploader \
  com.sec.android.app.wlantest \
  com.samsung.android.voc \
  com.samsung.android.samsunganalytics.agent \
  com.sec.spp.push \
  com.samsung.android.mateagent \
  com.samsung.android.rlc
  com.samsung.android.app.simplesharing \
  com.dsi.ant.service.socket \
  com.android.managedprovisioning \
  com.sec.android.preloadinstaller \
  com.samsung.android.app.sbrowseredge \
  com.microsoft.office.officehubrow \
  com.monotype.android.font.samsungone \
  flipboard.boxer.app \
}
pm uninstall --user 0 "$debloat" > /dev/null 2>&1
ui_print " "
ui_print "First of all, step 1 of Floha installation is done."
ui_print "Now, we will proceed to step 2, which is critical for your device."
sleep 1
ui_print "I am backupping your stock kernel to /sdcard/floha/backup."
ui_print "After a successful backup, we will proceed to install Floha Kernel+ which will improve performance."
mkdir -p /sdcard/floha/backup
su -c "dd if=/dev/block/bootdevice/by-name/boot of=/sdcard/floha/backup/stock_kernel.img bs=4096"
if [ $? -eq 0 ]; then
  ui_print "Stock kernel backup successful!"
else
  printfail "Stock kernel backup failed! Please check your storage and try again."
  exit 1
fi
sleep 1
ui_print "Installing Floha Kernel+..."
su -c "dd if=/data/local/tmp/floha_kernel_plus.img of=/dev/block/bootdevice/by-name/boot bs=4096"
if [ $? -eq 0 ]; then
  ui_print "Floha Kernel+ installed successfully!"
else
  printfail "Floha Kernel+ installation failed! Please contact with author."
  exit 1
fi

ui_print "If your device is stuck in a bootloop, reboot into recovery and restore the stock kernel."
ui_print "To restore the stock kernel, use the following command in recovery:"
ui_print "dd if=/sdcard/floha/backup/stock_kernel.img of=/dev/block/bootdevice/by-name/boot bs=4096"
ui_print "After restoring the stock kernel, reboot your device and it should boot normally."
ui_print " "
ui_print " "

ui_print "———————————————————————————————————————————————"
ui_print "       Floha installation completed!"
ui_print "      Reboot your device to see magic."
ui_print "————————————————————————————————————————————————"
ui_print "Make sure you don't remove the backup boot image. It is required for uninstallation."