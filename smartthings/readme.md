Customize the MQTT host

$ vi config.yml
# Restart the service to get the latest changes
Install the Device Handler in the Device Handler IDE using "Create via code"
https://github.com/stjohnjohnson/smartthings-mqtt-bridge/blob/master/devicetypes/stj/mqtt-bridge.src/mqtt-bridge.groovy



Add the "MQTT Device" device in the My Devices IDE. Enter MQTT Device (or whatever) for the name. Select "MQTT Bridge" for the type. The other values are up to you.

Configure the "MQTT Device" in the My Devices IDE with the IP Address, Port, and MAC Address of the machine running the Docker container

Install the Smart App on the Smart App IDE using "Create via code"
https://github.com/stjohnjohnson/smartthings-mqtt-bridge/blob/master/smartapps/stj/mqtt-bridge.src/mqtt-bridge.groovy

Configure the Smart App (via the Native App; on Android, this must be the Classic version) with the devices you want to share and the Device Handler you just installed as the bridge

Via the Native App, select your MQTT device and watch as MQTT is populated with events from your devices
