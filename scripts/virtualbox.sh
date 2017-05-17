echo "==============================================================================="
echo "virtualbox.sh"
echo "==============================================================================="

VBOX_VERSION=$(cat /home/vagrant/.vbox_version)

# required for VirtualBox 4.3.26

yum install -y bzip2 fuse-libs

# Required for VirtualBox
# Reference: https://github.com/probonopd/AppImageKit/wiki/FUSE

yum --enablerepo=epel -y install fuse-sshfs

# Add VBoxLinux additions

cd /tmp
mount -o loop /home/vagrant/VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
sh /mnt/VBoxLinuxAdditions.run
umount /mnt
rm -rf /home/vagrant/VBoxGuestAdditions_*.iso

