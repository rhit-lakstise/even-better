# even-better
Senior project for 2021-2022 team 11


Get a private key from: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/putty.html

To upload a new version of the server:

1.) Create a zip file of the server folder

2.) Connect to the server using putty. Url is "ec2-3-137-199-220.us-east-2.compute.amazonaws.com" and the user is "ec2-user" and the key is the "license-keys.pem" file inside of the "even-better" directory

![image](https://user-images.githubusercontent.com/45301418/146040128-57ab175a-e8a6-49b8-8810-c80db3f4cfd8.png)
 
Hose name: ec2-user@ec2-3-137-199-220.us-east-2.compute.amazonaws.com

![image](https://user-images.githubusercontent.com/45301418/146040187-52e0f4a3-314f-4000-8432-0352b6234777.png)

Choose the private key and click “open”


3.) do "rm server.zip" to delete the old version of the server

4.) Upload that zip file using this command on git bash: "scp -i ./license-keys.pem ./server.zip ec2-user@ec2-3-137-199-220.us-east-2.compute.amazonaws.com:/home/ec2-user"

5.) We need to stop the current version of the server from running, so do "tmux attach -t server" to enter the session the server is running in

6.) do ctrl+c to stor the server from running

7.) do ctrl+b then ":", that should open a yellow text field at the bottom, type "kill-session" and then hit enter to end the session

8.) now do "rm -r server" to delete the old version of the server

9.) do "unzip server.zip" to unzip the new version of the server

10.) do "cd server" to enter the version of the server you just unzipped

11.) do "n" to create a new session for the server to run in it

12.) do "npm start" to start the server

13.) do ctrl+b then press "b" to detach from the server session, or just close the putty window

