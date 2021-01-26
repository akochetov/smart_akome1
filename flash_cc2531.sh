sudo apt-get install wiringpi
cd ~/tmp
git clone https://github.com/jmichault/flash_cc2531.git
cd flash_cc2531
./cc_chipid
cd ~/tmp/flash_cc2531
wget https://github.com/Koenkk/Z-Stack-firmware/raw/master/coordinator/Z-Stack_Home_1.2/bin/default/CC2531_DEFAULT_20190608.zip
unzip CC2531_DEFAULT_20190608.zip  
./cc_erase
./cc_write CC2531ZNP-Prod.hex
ls -l /dev/serial/by-id 
