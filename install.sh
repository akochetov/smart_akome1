
if [ -x "$(command -v docker)" ]; then
    echo "Docker is already installed. Proceeding."
else
    echo "Install docker..."
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
fi

echo "Downloading mosquitto docker image..."
docker pull eclipse-mosquitto

echo "Starting mosquitto container in auto-restart mode..."
docker run -d -it -p 1883:1883 --restart always --name mosquitto eclipse-mosquitto 

echo "Downloading zigbee2mqtt docker image..."
docker pull koenkk/zigbee2mqtt --platform linux/arm/v6

echo "Starting zigbee2mqtt container in auto-restart mode..."
docker run -d -it -v $(pwd)/data:/app/data --device=/dev/ttyACM0 -v /run/udev:/run/udev:ro --privileged=true --network host --restart always --name zigbee2mqtt koenkk/zigbee2mqtt

