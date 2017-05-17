echo "==============================================================================="
echo "cpp.sh - Install C++ development environment"
echo "==============================================================================="

export GCC_VERSION=4.8.5

yum -y install \
   curl-devel \
   gcc-$GCC_VERSION \
   gcc-c++ \
   gd-devel \
   glibc-devel \
   kernel-devel \
   libgcc \
   libidn-devel \
   libxml2 \
   libxml2-devel \
   libxslt-devel \
   make \
   openssl-devel
