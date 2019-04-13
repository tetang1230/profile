#!/usr/bin/env bash
# @describe: 串行部署多台机器

#set -x

# terminal color
    red=$'\e[1;31m'
  green=$'\e[1;32m'
 yellow=$'\e[1;33m'
   blue=$'\e[1;34m'
magenta=$'\e[1;35m'
   cyan=$'\e[1;36m'
  white=$'\e[1;37m'
 normal=$'\e[m'

function usage() {
    echo "${green}$0${normal} ${yellow}project$normal"
    echo "${green}$0${normal} ${magenta}api | admin | business$normal"
    exit 0
}

if [ $# -lt 1 ]
then
    usage
fi
project=$1
if [ "$project" != "api" ] && [ "$project" != "admin" ] && [ "$project" != "business" ] 
then
    usage
fi

remoteHosts="gfpay dxpay axpay ipay333"
cmd="cd /work/go/src/fpay/$project && ./shell/invoke-build-deploy.sh"
echo "[`date +"%Y-%m-%d %H:%M:%S"`] ${red}cmd$normal: '$cyan$cmd$normal'"

for host in $remoteHosts
do
    echo "[`date +"%Y-%m-%d %H:%M:%S"`] ${magenta}start for $blue$host $yellow$project$normal"
    ssh work@"$host" "$cmd"
    if [ $? != 0 ]
    then
        echo "[`date +"%Y-%m-%d %H:%M:%S"`] ${red}exec cmd get exception, host: $host, project: $project, cmd: $cmd$normal"
        exit 1
    else
        echo "[`date +"%Y-%m-%d %H:%M:%S"`] ${green}exec cmd success, ${blue}host: $host, ${yellow}project: $project$normal"
    fi
done

# vim:set ts=4 sw=4 et fdm=marker:

