#!/usr/bin/env bash
#Author: SAGAR
#ID : sagar-unix
#Designation: DevOps Engineer
set -x 
cd /tmp/
yum erase -y google-chrome-stable || true
rm -rf /opt/google/chrome || true
wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
yum localinstall google-chrome-stable_current_x86_64.rpm
rm google-chrome-stable_current_x86_64.rpm
chrome_version=$(yum info  google-chrome-stable |grep -e "Version\b.*[d\.]*"|cut -d ':' -f2|cut -d "." -f1,2,3|awk '{$1=$1};1')
exact_chrome_version=$(curl https://chromedriver.storage.googleapis.com/LATEST_RELEASE_${chrome_version})
rm chromedriver_linux64.zip
wget  https://chromedriver.storage.googleapis.com/${exact_chrome_version}/chromedriver_linux64.zip
unzip -o chromedriver_linux64.zip -d /opt/google/chrome/
chmod a+x /opt/google/chrome/chromedriver
ln -s /opt/google/chrome/chromedriver /usr/bin/chromedriver
exit 0
