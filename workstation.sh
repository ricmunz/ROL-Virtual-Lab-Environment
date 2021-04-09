#!/bin/sh

# Make the bash prompts bold with green color.
export PS1='\[\e[1;32m\][\u@\h \w]\$\[\e[0m\] '

# Change display resolution

# Get and save current resolution in case we need to revert.
prev_res=$(xrandr | grep \* | awk '{print $1}')
echo "Current resolution: ${prev_res}"

#Set to new resolution 1600x900 (16:9 60Hz)
new_res="1600x900"
xrandr --output Virtual-1 --mode ${new_res}
echo "    New resolution: ${new_res}"
