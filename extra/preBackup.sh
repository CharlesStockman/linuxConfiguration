#
# Purpose : To clean the Home Directory which will include 
#	the remove of dead.letter
#	Cleaning the pom files
#
cd $HOME
( cd $HOME/.atom ; rm -rf *            )
( cd $HOME/Downloads ; rm -rf *        ) 
( cd $HOME/.cache ; rm -rf *           ) 
( cd $HOME/mozilla/.firefox ; rm -rf * )
rm -rf dead.letter
mavenClean  

