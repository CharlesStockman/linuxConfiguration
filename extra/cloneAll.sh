#
# Purpose : Download all repositories form Github and put them into the directory referenced by config_github_top_level_directory
#

username=`echo $config_github_username`
personalAccessToken=`echo $config_github_personalAccessToken`

#
# Get the name of the repositorie from Github
#    clone them into value retireved from the config_github_directory
# 
repositories=`curl -u $username:$personalAccessToken https://api.github.com/user/repos?type=all | jq '.[].clone_url'` 
for repository in $repositories 
do
	repository=$( echo $repository | sed 's/"//g' | sed "s/github\.com/$personalAccessToken\@github.com/" )
	( cd $config_github_top_level_directory ; git clone $repository )	
done


