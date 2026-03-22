#!/system/bin/sh

ui_print "———————————————————————————————————————————————"
ui_print "        Welcome to Floha Uninstaller!"
ui_print "      Uninstallation will begin shortly."
ui_print "————————————————————————————————————————————————"
sleep 3

# Restore all apps that we removed

restoreApps=(
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
)

cmd package install-existing "${restoreApps[@]}" 2>/dev/null
ui_print " "
ui_print "All apps have been restored. Now, we will proceed to restore the stock kernel."
sleep 3 
su -c "dd if=/sdcard/floha/backup/stock_kernel.img of=/dev/block/bootdevice/by-name/boot bs=4096"
ui_print "Stock kernel restored successfully!"
ui_print " "
ui_print "To ensure a clean uninstallation, I will also remove the backup kernel image from your device."
rm -f /sdcard/floha/backup/stock_kernel.img
ui_print "Backup kernel image removed."
ui_print " "
ui_print "———————————————————————————————————————————————"
ui_print "       Floha uninstallation completed!"
ui_print "      Reboot your device to see magic."
ui_print "————————————————————————————————————————————————"