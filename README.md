# Purpose

Distrohopping is a fact of life for linux users.  I am working on making it easier.  The basic idea is there are three steps 
to building a linux enivronment.  The three steps are:

			* Install the sofware from multiple repostiroes including arch, pip and docker
			* retrieve dotifles
			* configure the linux system using scripts

## Steps

#### Step 1. Prepararation
### Clone the directory
	git clone https://github.com/CharlesStockman/linuxConfiguration.git
	
### Transform into a user that can run privlaged commands
	sudo bash and then enter the password
			
#### Directory containing the scripts to install the software fro the different repositories
* cd linuxConfiguration/distro
* cd \<distroDirectory\>
			
#### load the function into the shell that will be used to Install the Software
* . ../reuse.sh			loads the reusable functions
* . ./commands.sh		loads the function, that will install the software from different repositories, into the shell
* . ./repository.sh		loads the associative array(s) that contains software that should be installed on the system into the shell.

##### On the command line call the functions to install the software
* installAll 			--> Install all the software using the package executable ( Curretnly install pacman and pip and Docker )
* updateWorld			--> updates the system

##### Standard functions found in the command.sh and reuse.sh
* updateWorld			--> updates the installed software to the most current versions
* installAll			--> Installs all the software using the correct package manager for each.
* search 			--> search for a package based on the string entered

##### Modify the JON File
* cd ../configuration 
* ansible-playbook createDescription.yaml			--> Create a direcotry and copy description.json into it 
* cd `<data>`
* edit the description.json and put the values for your system in it. 

#### Run the scripts to configure the system
* cd `..`
* . ./jsonToEnv.sh 			--> Convert the JSON Entries to Environment Varaibles
* ansible-playbook git.yaml		--> Configures the Global Configuration Git Variables to allow Git to be used		

#### Clone all Repositories
* mkdir $HOME/git
* cd $HOME/git
* cloneAll.sh				--> Clones public and private repositories.  

