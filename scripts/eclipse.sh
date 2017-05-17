#!/bin/bash

echo "==============================================================================="
echo "Install Eclipse"
echo "==============================================================================="

# Define filename.

export ECLIPSE_FILENAME=eclipse-cpp-neon-3-linux-gtk-x86_64.tar.gz

# Download file.

wget \
    -O /var/tmp/${ECLIPSE_FILENAME} \
    http://mirror.csclub.uwaterloo.ca/eclipse/technology/epp/downloads/release/neon/3/${ECLIPSE_FILENAME}

# Extract file.

tar -zxvf /var/tmp/${ECLIPSE_FILENAME} -C /opt/

# Create a link to eclipse.

ln -s /opt/eclipse/eclipse /usr/local/bin/eclipse

# Move desktop icon.

mv /tmp/files/root/usr/share/applications/eclipse-neon-cpp.desktop /usr/share/applications/eclipse-neon-cpp.desktop

# Remove Tar GZ file

rm -f /var/tmp/${ECLIPSE_FILENAME} 


