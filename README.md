# Purpose

Distrohopping is a fact of life for linux users.  I am working on making it easier.  The basic idea is there are three steps 
to building a linux enivronment.  The three steps are:

			* Install the sofware
			* retrieve dotifles
			* configure the linux system using scripts

## Steps

### Clone the directory
	git clone https://github.com/CharlesStockman/linuxConfiguration.git
			
#### Directory containing the scripts to install the software
* cd `<cloned directory>`
* cd `<distro>`
* cd `<disto family>`
			
#### Install the software
* ./command.sh											--> load the commands ( ex. installs, updateWorld )
* ./repository.sh										--> software to be loaded
			
* ./installs 											--> installs all the software found in repository.sh
* ./updateWorld											--> updates the software to the most current versions
					
#### cd into the Software Configuration
* cd `<cloned directory>`
* cd `<configuration>`
			
#### Add your information into the json file					
* ansible-playbook createDescription.yaml			--> Create a direcotry and copy description.json into it 
* cd `<data>`
* edit the description.json and put the values for your system in it. 

#### Run the scripts to configure the system
* cd `..`
* . ./jsonToEnv.sh 			--> Add the JSON Entries to Environment Varaibles
* ansible-playbook git.yaml		--> Configures the Global Configuration Git Variables		

#### Clone all the repositories for a signle user using the ifnromation from description.json
* . ./clooneAll.sh 

