# GREAT-EASTERN dotfiles
GREAT-EASTERN is my headless Debian server (or soon to be). It previously ran Unraid, a fork of Slackware Linux. The distro was fine for learning the basics of server infrastructure, including docker containers and networking, but was restrictive in too many areas. My pain points were:

+ The fact that the root directory is wiped after every reboot
+ The lack of a package manager or easy way to install custom applications
+ The reliance on docker for the deployment of all applications
+ The fact that updates are paywalled
+ The inability to create and save server deployment infrastructure, meaning configurations could be lost (this happened a lot because the root filesystem wiped every reboot)

Because I'm now comfortable with Linux, I figured it would be a good idea to move over to Debian to alleviate all these pain points, and because of the distribution's stability. One major advantage is the ability to write the entire server configuration and application infrastruture before setting up the server in the first place. That's what these dotfiles are for.

## Tree and Organization

## Installation and Setup
Firstly, make sure to set up a new user with new permissions so that you're not doing everything with root. Then clone this repository to your ~ directory and rename it `.dotfiles` (the path should be `/home/<username>/.dotfiles`). Make sure you `sudo apt install git` beforehand. 

Now run the `install.sh` script in the setup directory. Make sure to run that script with root privledges. This will install the packages necessary for the server, remove unnecessary packages, place the stow packeges, and change the shell over.
