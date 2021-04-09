url='https://raw.githubusercontent.com/ricmunz/ROLVirtualLabEnv/main/'
apath='/etc/profile.d/bash_Color-Prompts.sh'
cmd="wget -O $apath ${url}"
cmd2='ssh root@server'
valid="(grep PS1 $apath) | (grep -o --color=always '1;3.m')"

# ------------------------------------------
# Changing display resolution on workstation
# ------------------------------------------

# Get and save current resolution in case we need to revert.
prev_res=$(xrandr | grep \* | awk '{print $1}')
echo "Current resolution: ${prev_res}"
# Set to new resolution 1600x900 (16:9 60Hz)
new_res="1600x900"
xrandr --output Virtual-1 --mode ${new_res}
echo "    New resolution: ${new_res}"

# ------------------------------
# Now changing the shell prompts
# ------------------------------

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
printf '   1;32m  '; eval $valid
printf '   1;34m  '; ${cmd2}a $valid
printf '   1;33m  '; ${cmd2}b $valid
}
