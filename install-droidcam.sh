# Reinstall droidcam
cd /tmp/
wget -O droidcam_latest.zip https://files.dev47apps.net/linux/droidcam_2.0.0.zip
unzip droidcam_latest.zip -d droidcam
cd droidcam && sudo ./install-client

# Configure Video
sudo ./install-video

# Reinitialize with HD settings
sudo rmmod v4l2loopback_dc
sudo insmod /lib/modules/`uname -r`/kernel/drivers/media/video/v4l2loopback-dc.ko width=1920 height=1080

# Configure HD image
touch droidcam.conf
echo "options v4l2loopback_dc width=1920 height=1080" > droidcam.conf
sudo mv droidcam.conf /etc/modprobe.d/
