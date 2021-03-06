echo "==============================================================================="
echo "base.sh"
echo "==============================================================================="

sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers

echo "==============================================================================="
echo "Get a clean yum database"
echo "==============================================================================="

# yum -y update
# yum clean all

echo "==============================================================================="
echo "Get the 'Extra Packages for Enterprise Linux'"
echo "==============================================================================="

yum -y install epel-release
yum clean all
