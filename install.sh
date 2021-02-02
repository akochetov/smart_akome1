
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
docker run -d -it -p 1883:1883 -v $(pwd)/mosquitto/mosquitto.conf:/mosquitto/config/mosquitto.conf --restart always --name mosquitto eclipse-mosquitto 

echo "Downloading zigbee2mqtt docker image..."
docker pull koenkk/zigbee2mqtt --platform linux/arm/v6
echo "Starting zigbee2mqtt container in auto-restart mode..."
docker run -d -it -v $(pwd)/data:/app/data --device=/dev/ttyACM0 -v /run/udev:/run/udev:ro --privileged=true --network host --restart always --name zigbee2mqtt koenkk/zigbee2mqtt

echo "Build Homebridge docker image..."
cd homebridge
docker build -t homebridge .
echo "Starting Homebridge container in auto-restart mode..."
cd ..
docker run -d -it -v $(pwd)/homebridge:/homebridge --privileged=true --network host --restart always --name homebridge oznu/homebridge

echo "Downloading smartthings bridge..."
docker stop smartthings
docker rm smartthings

git clone https://github.com/stjohnjohnson/smartthings-mqtt-bridge
cd smartthings-mqtt-bridge
rm Dockerfile
cp Dockerfile-rpi Dockerfile
docker build -t smartthings .
cd ..
rm -R smartthings-mqtt-bridge

echo "Starting smartthings bridge in auto-restart mode..."
docker run -d -it --name=smartthings -v $(pwd)/smartthings:/usr/src/app/config -p 49312:49312 smartthings

