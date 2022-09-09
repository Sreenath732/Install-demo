sudo apt install gnupg postgresql-common apt-transport-https lsb-release wget

sudo /usr/share/postgresql-common/pgdg/apt.postgresql.org.sh

sudo apt install curl

sudo curl -L https://packagecloud.io/timescale/timescaledb/gpgkey | sudo apt-key add -

sudo sh -c "echo 'deb https://packagecloud.io/timescale/timescaledb/ubuntu/ $(lsb_release -c -s) main' > /etc/apt/sources.list.d/timescaledb.list"

su -c 'wget --quiet -O - https://packagecloud.io/timescale/timescaledb/gpgkey | apt-key add -' root

sudo apt update

sudo apt install timescaledb-2-postgresql-14

sudo sed -i "275i shared_preload_libraries = 'timescaledb'" /etc/postgresql/14/main/postgresql.conf

sudo service postgresql restart

sudo -u postgres psql -c 'CREATE DATABASE plc_data';

sudo -u postgres psql -d 'plc_data' -c 'CREATE EXTENSION IF NOT EXISTS timescaledb CASCADE';

sudo -u postgres psql -c "ALTER USER postgres PASSWORD 'postgres'";
