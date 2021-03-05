apath='/etc/profile.d/bash_Color-Prompts.sh'
cmd2='ssh root@server'
cmd_rmv="rm -f $apath"
#Removing from workstation
$cmd_rmv
#Removing from servera
${cmd2}a $cmd_rmv
#Removing from serverb
${cmd2}b $cmd_rmv

echo ...Removed formatting
exit
