url='https://raw.githubusercontent.com/ricmunz/ROLVirtualLabEnv/main/'
apath='/etc/profile.d/bash_Color-Prompts.sh'
cmd="wget -O $apath ${url}"
cmd2='ssh root@server'
valid="(grep PS1 $apath) | (grep -o --color=always '1;3.m')"

#Configuring workstation
echo Configuring workstation...
${cmd}workstation.sh

#Configuring servera and serverb
echo Configuring servera...
${cmd2}a ${cmd}servera.sh
echo Configuring serverb...
${cmd2}b ${cmd}serverb.sh

# VALIDATION
{
echo Validating changes...
echo "Expected  Actual"
#Need to have this eval here but not sure why not for remote
printf '  1;32m   '; eval $valid
printf '  1;34m   '; ${cmd2}a $valid
printf '  1;33m   '; ${cmd2}b $valid
}
