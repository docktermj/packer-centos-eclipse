echo "==============================================================================="
echo "postgress.sh - Install postgress"
echo "==============================================================================="

# References:
# - https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-centos-7
# - http://stackoverflow.com/questions/42419559/postgres-createuser-with-password-from-terminal

yum -y install postgresql-server postgresql-contrib

# Initialize postgress

postgresql-setup initdb

# Modify /var/lib/pgsql/data/pg_hba.conf
# - Change "ident" to "md5"

sed -i.$(date +'%s') \
  -e 's/ident/md5/g' \
  /var/lib/pgsql/data/pg_hba.conf

# Auto-start postgress

systemctl start postgresql
systemctl enable postgresql

# As postgress user, create role and database

su - postgres -c "psql -c \"create role bixdata with login password 'password';\""
su - postgres -c "createdb bixdata"

