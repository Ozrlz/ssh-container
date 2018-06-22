# About
This repo is for the intro to linux course.
It creates a container based on ubuntu and exposes port 22 to allow ssh conections.

# How to use it
* $ docker container image build . -t sshd:1.0
* $ docker container run -it -p 9871:22 --name sshd sshd:1.0

Then, to connect to it
* $ ssh coco01@ip -p 9871

# IMPORTANT

If you are building from windows and changed anything in the create_users script,
replace the CR-LF by LF. Otherwise you wikk have problems when building the image.

You can achieve this by using dos2unix tool.
https://waterlan.home.xs4all.nl/dos2unix/es/man1/dos2unix.htm

