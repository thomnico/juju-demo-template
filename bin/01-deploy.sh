#!/bin/bash
#####################################################################
#
# Deploy demo
#
# Notes: 
# 
# Maintainer: Samuel Cozannet <samuel.cozannet@canonical.com> 
#
#####################################################################

# Validating I am running on debian-like OS
[ -f /etc/debian_version ] || {
	echo "We are not running on a Debian-like system. Exiting..."
	exit 0
}

# Load Configuration
MYNAME="$(readlink -f "$0")"
MYDIR="$(dirname "${MYNAME}")"
MYCONF="${MYDIR}/../etc/demo.conf"
MYLIB="${MYDIR}/../lib/bashlib.sh"
JUJULIB="${MYDIR}/../lib/jujulib.sh"

for file in "${MYCONF}" "${MYLIB}" "${JUJULIB}"; do
	[ -f ${file} ] && source ${file} || { 
		echo "Could not find required files. Exiting..."
		exit 0
	}
done 

# Check install of all dependencies
log debug Validating dependencies
ensure_cmd_or_install_package_apt git git-all

# Switching to project 
switchenv "${PROJECT_ID}" 

# Deploy charms with constraints from the standard repos
# deploy apache-zookeeper zookeeper mem=2G cpu-cores=2

# Add units easily with log
# add-unit kafka 3

# Add relations easily with log
# add-relation kafka zookeeper


