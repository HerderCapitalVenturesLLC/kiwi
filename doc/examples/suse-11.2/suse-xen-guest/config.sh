#!/bin/bash
#================
# FILE          : config.sh
#----------------
# PROJECT       : OpenSuSE KIWI Image System
# COPYRIGHT     : (c) 2006 SUSE LINUX Products GmbH. All rights reserved
#               :
# AUTHOR        : Marcus Schaefer <ms@suse.de>
#               :
# BELONGS TO    : Operating System images
#               :
# DESCRIPTION   : configuration script for SUSE based
#               : operating systems
#               :
#               :
# STATUS        : BETA
#----------------
#======================================
# Functions...
#--------------------------------------
test -f /.kconfig && . /.kconfig
test -f /.profile && . /.profile

#======================================
# Greeting...
#--------------------------------------
echo "Configure image: [$kiwi_iname]..."

#======================================
# Setup baseproduct link
#--------------------------------------
suseSetupProduct

#======================================
# Activate services
#--------------------------------------
suseActivateDefaultServices
suseInsertService boot.device-mapper
suseInsertService sshd
suseInsertService boot.xen

#======================================
# SuSEconfig
#--------------------------------------
baseUpdateSysConfig /etc/sysconfig/windowmanager DEFAULT_WM kde
baseUpdateSysConfig /etc/sysconfig/displaymanager DISPLAYMANAGER kdm
baseSetRunlevel 5
suseConfig

#======================================
# clone runlevel 3 to 4
#--------------------------------------
suseCloneRunlevel 4

#======================================
# Umount kernel filesystems
#--------------------------------------
baseCleanMount

exit 0
