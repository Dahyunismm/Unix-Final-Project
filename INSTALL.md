# Installing and Setting up the Server :

1. Order a VPS from a trusted website. An example would be OVH https://www.ovhcloud.com/en-ca/vps/

2. Review the order summary and the provider will send an email of all the information needed to access the vps

3. Log in via SSH with the information given (ovh would be : debian@ip)

4. Once you're in, make a user and add it to the sudo group

5. Upgrade the system to the latest packages

# Setting up the website and the auto deployment script:

1. Clone the github repository to your server

2. Add the script in /usr/bin and make sure its executable (use chmod).
script :
*note : change the directories from the script to the directory of your server

3. Setup a service for the script:
    - Add the service file in /etc/systemd/system/
service:

4. Setup a timer in the same folder so that the script runs every 5 mins.
timer:

5. Enable everything with systemctl enable.

6. Check if everything is running with systemctl status.

7. Website should be running now! Check with YOURIP/_site




