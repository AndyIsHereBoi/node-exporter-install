#start
echo "Creating folders..."
mkdir /etc/node-exporter
cd /etc/node-exporter

# download and move files
echo "Downloading files..."
wget https://github.com/prometheus/node_exporter/releases/download/v1.3.1/node_exporter-1.3.1.linux-amd64.tar.gz

# extract files
echo "Extracting and moving files..."
tar -xzf ./node_exporter-1.3.1.linux-amd64.tar.gz
mv ./node_exporter-1.3.1.linux-amd64/* ./

# delete old files
echo "Cleaning up old files..."
rm ./node_exporter-1.3.1.linux-amd64.tar.gz
rm -rf ./node_exporter-1.3.1.linux-amd64/

# set service file
echo "Creating service file..."
echo -e "[Unit]\nDescription=example systemd service unit file.\n\n[Service]\nExecStart=/etc/node-exporter/node_exporter\n\n[Install]\nWantedBy=multi-user.target\n" >> /etc/systemd/system/node-exporter.service

# enable and start service
echo "Creating and enabling service files...."
systemctl reload-daemon
systemctl enable node-exporter
systemctl start node-exporter

# done message
echo "Install complete."
