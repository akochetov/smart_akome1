docker stop smartthings
docker rm smartthings

git clone https://github.com/stjohnjohnson/smartthings-mqtt-bridge
cd smartthings-mqtt-bridge
rm Dockerfile
cp Dockerfile-rpi Dockerfile
docker build -t smartthings .
cd ..
rm -R smartthings-mqtt-bridge

docker run -d -it --name=smartthings -v $(pwd)/smartthings:/config -p 49312:8080 smartthings
