# Purpose

Distrohopping is a fact of life for linux users.  I am working on making it easier.  The basic idea is there are three steps 
to building a linux enivronment.  The three steps are:

			* Install the sofware from multiple repositories including arch, pip and docker
			* retrieve dotifles
			* configure the linux system using scripts

By Separating the intallation of the software from the configuration, the configuration script can only be written once and we can have multiple installation scripts where each installation script for a linux distribution.		

## Steps

### Step 1. Prepararation
#### Clone the directory
	git clone https://github.com/CharlesStockman/linuxConfiguration.git
	
#### Transform into a user that can run privlaged commands
	sudo bash and then enter the password
	
### Step 2. Install the software 
#### Directory containing the scripts to install the software for different repositories ( linux distos, pip, docker files )
* cd linuxConfiguration/distro
* cd \<distroDirectory\>
			
#### load the function into the shell that will be used to Install the Software
* . ../reuse.sh			loads the reusable functions that will be reused by dffrerent commands.sh 
* . ./commands.sh		loads the function, that will install the software from different repositories, into the shell
* . ./repository.sh		loads the associative array(s) that contains software that should be installed on the system into the shell.

Note: Each Command.sh will contain the functions to install software from one linux distribution.

##### On the command line call the functions to install the software
* installAll 			--> Install all the software using the package executable ( Curretnly install pacman and pip and Docker )
* updateWorld			--> updates the system

##### Standard functions found in the command.sh and reuse.sh
* updateWorld			--> updates the installed software to the most current versions
* installAll			--> Installs all the software using the correct package manager for each.
* search 			--> search for a package based on the string entered

At this point the software has been installed, but is not configured.

### Step 3 Condigure The Basic Software

	The Basic Characteristic of the Software Environment:
	* Create a configuration file to allow the user to tailer all the configuration scripts
	* Create a remote drive that can accessed very quickly.
	* Configure a password manager
	
##### Create the Configuration File
**Introuction** -- Create the enviornment variables that will allow the configuration script to be tailored to the specific environment

* cd linuxConfiguration/basic/configure
* ansible-playbook createDescription.yaml			--> Create a direcotry and copy description.json into it 
* cd `<data>`
* edit the description.json and put the values for your system in it.
* cd ..
* . ./jsonToEnv.sh data/description.json 			--> Convert the descriptino.json into environemntal variables

#### Run the scripts to configure the system
* cd `..`
* . ./jsonToEnv.sh 			--> Convert the JSON Entries to Environment Varaibles
* ansible-playbook git.yaml		--> Configures the Global Configuration Git Variables to allow Git to be used		

#### Clone all Repositories
* mkdir $HOME/git
* cd $HOME/git
* cloneAll.sh				--> Clones public and private repositories.  

