#!/usr/bin/env bash
sudo curl https://intoli.com/install-google-chrome.sh | bash
sudo mv /usr/bin/google-chrome-stable /usr/bin/google-chrome
google-chrome –-version && which google-chrome
cd /tmp/
chrome_version=$(yum info  google-chrome|grep -e "Version\b.*[d\.]*"|cut -d ':' -f2|cut -d "." -f1,2,3|awk '{$1=$1};1')
exact_chrome_version=$(curl https://chromedriver.storage.googleapis.com/LATEST_RELEASE_${chrome_version})
rm chromedriver_linux64.zip
wget  https://chromedriver.storage.googleapis.com/${exact_chrome_version}/chromedriver_linux64.zip
unzip -o chromedriver_linux64.zip -d /opt/google/chrome
chmod a+x /opt/google/chrome/chromedriver
cp /opt/google/chrome/chromedriver /opt/google/chrome/chromedriver-sandbox
ln -s /opt/google/chrome/chromedriver /usr/bin/chromedriver
chromedriver – version
