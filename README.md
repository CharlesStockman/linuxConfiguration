# Purpose

Distrohopping is a fact of life for linux users.  I am working on making it easier.  The basic idea is there are three steps 
to building a linux enivronment.  The three steps are:

			* Install the sofware
			* retrieve dotifles
			* configure the linux system using scripts

## Steps

### Clone the directory
	git clone https://github.com/CharlesStockman/linuxConfiguration.git
	
### Transform into a user that can run privlaged commands
	sudo bash and then enter the password
			
#### Directory containing the scripts to install the software
* cd linuxConfiguration/distro
* cd distroDirectory
			
#### Install the Software

* . ./commands.sh		load the function from the file into the shell
* . ./repository.sh		loads the associative array that contains software that should be installed on the system into the shell.

##### On the command line call the functions to install the software

* installs 			--> installs each package from the associative array found in the repository.sh
* updateWorld			--> updates the system

##### Standard functions found in the command.sh

* command.sh			--> loads the funtions ( ex. installs, updateWorld ) into the shell
* repository.sh			--> loads the associative array that contains software that should be installed on the system into the shell\
* updateWorld			--> updates the installed software to the most current versions
* installs 			--> installs all the software found in the associtive array
* search 			--> search for a package based on the string entered
					
#### Add information to the Json File
* cd ..
* cd configuration
			
##### Modify the JON File					
* ansible-playbook createDescription.yaml			--> Create a direcotry and copy description.json into it 
* cd `<data>`
* edit the description.json and put the values for your system in it. 

#### Run the scripts to configure the system
* cd `..`
* . ./jsonToEnv.sh 			--> Add the JSON Entries to Environment Varaibles
* ansible-playbook git.yaml		--> Configures the Global Configuration Git Variables		

#### Clone all the repositories for a signle user using the information from description.json
cd $config_github_top_level_directory=/home/cstockman/git
* . ./cloneAll.sh 

