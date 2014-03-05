# Install

## server environment

* through eth0 to connect, acctual no relation with eth0's IP

```
auto lo
iface lo inet loopback

auto eth1
allow-hotplug eth1
iface eth1 inet static
        address 192.168.100.3
        netmask 255.255.255.0
        gateway 192.168.100.1

auto eth0
allow-hotplug eth0
iface eth0 inet static
        address 192.168.254.1
        netmask 255.255.255.0

```

## Download & compile

```
wget -c  http://www.roaringpenguin.com/files/download/rp-pppoe-3.10.tar.gz 
tar -zxvf rp-pppoe-3.10.tar.gz
cd rp-pppoe-3.10/src
./configure
make
make install 

```

##  configuration
        

* /etc/ppp/chap-secrets

```
"tad"	*	"tad"	*
```


* /etc/ppp/pppoe-server-options 

```
require-pap
login
lcp-echo-interval 10
lcp-echo-failure 2
ms-dns 8.8.8.8
ms-dns 8.8.4.4
defaultroute

```

## start

```
echo 1 > /proc/sys/net/ipv4/ip_forward
pppoe-server -I eth0 -L 192.168.100.201 -R 192.168.100.202 -N 20
```

## Others info

```
root@srv100-3:/etc/ppp# cat pppoe.conf
#***********************************************************************
#
# pppoe.conf
#
# Configuration file for rp-pppoe.  Edit as appropriate and install in
# /etc/ppp/pppoe.conf
#
# NOTE: This file is used by the pppoe-start, pppoe-stop, pppoe-connect and
#       pppoe-status shell scripts.  It is *not* used in any way by the
#       "pppoe" executable.
#
# Copyright (C) 2000 Roaring Penguin Software Inc.
#
# This file may be distributed under the terms of the GNU General
# Public License.
#
# LIC: GPL
# $Id$
#***********************************************************************

# When you configure a variable, DO NOT leave spaces around the "=" sign.

# Ethernet card connected to DSL modem
ETH='eth0'

# PPPoE user name.  You may have to supply "@provider.com"  Sympatico
# users in Canada do need to include "@sympatico.ca"
# Sympatico uses PAP authentication.  Make sure /etc/ppp/pap-secrets
# contains the right username/password combination.
# For Magma, use xxyyzz@magma.ca
USER='tad'

# Bring link up on demand?  Default is to leave link up all the time.
# If you want the link to come up on demand, set DEMAND to a number indicating
# the idle time after which the link is brought down.
DEMAND=no
#DEMAND=300

# DNS type: SERVER=obtain from server; SPECIFY=use DNS1 and DNS2;
# NOCHANGE=do not adjust.
DNSTYPE=SERVER

# Obtain DNS server addresses from the peer (recent versions of pppd only)
# In old config files, this used to be called USEPEERDNS.  Changed to
# PEERDNS for better Red Hat compatibility
PEERDNS=yes

DNS1=
DNS2=202.106.0.20

# Make the PPPoE connection your default route.  Set to
# DEFAULTROUTE=no if you don't want this.
DEFAULTROUTE=yes

### ONLY TOUCH THE FOLLOWING SETTINGS IF YOU'RE AN EXPERT

# How long pppoe-start waits for a new PPP interface to appear before
# concluding something went wrong.  If you use 0, then pppoe-start
# exits immediately with a successful status and does not wait for the
# link to come up.  Time is in seconds.
#
# WARNING WARNING WARNING:
#
# If you are using rp-pppoe on a physically-inaccessible host, set
# CONNECT_TIMEOUT to 0.  This makes SURE that the machine keeps trying
# to connect forever after pppoe-start is called.  Otherwise, it will
# give out after CONNECT_TIMEOUT seconds and will not attempt to
# connect again, making it impossible to reach.
CONNECT_TIMEOUT=30

# How often in seconds pppoe-start polls to check if link is up
CONNECT_POLL=2

# Specific desired AC Name
ACNAME=

# Specific desired service name
SERVICENAME=pppoe-service

# Character to echo at each poll.  Use PING="" if you don't want
# anything echoed
PING="."

# File where the pppoe-connect script writes its process-ID.
# Three files are actually used:
#   $PIDFILE       contains PID of pppoe-connect script
#   $PIDFILE.pppoe contains PID of pppoe process
#   $PIDFILE.pppd  contains PID of pppd process
CF_BASE=`basename $CONFIG`
PIDFILE="/var/run/$CF_BASE-pppoe.pid"

# Do you want to use synchronous PPP?  "yes" or "no".  "yes" is much
# easier on CPU usage, but may not work for you.  It is safer to use
# "no", but you may want to experiment with "yes".  "yes" is generally
# safe on Linux machines with the n_hdlc line discipline; unsafe on others.
SYNCHRONOUS=no

# Do you want to clamp the MSS?  Here's how to decide:
# - If you have only a SINGLE computer connected to the DSL modem, choose
#   "no".
# - If you have a computer acting as a gateway for a LAN, choose "1412".
#   The setting of 1412 is safe for either setup, but uses slightly more
#   CPU power.
CLAMPMSS=1412
#CLAMPMSS=no

# LCP echo interval and failure count.
LCP_INTERVAL=20
LCP_FAILURE=3

# PPPOE_TIMEOUT should be about 4*LCP_INTERVAL
PPPOE_TIMEOUT=80

# Firewalling: One of NONE, STANDALONE or MASQUERADE
FIREWALL=MASQUERADE

# Linux kernel-mode plugin for pppd.  If you want to try the kernel-mode
# plugin, use LINUX_PLUGIN=/etc/ppp/plugins/rp-pppoe.so
LINUX_PLUGIN=

# Any extra arguments to pass to pppoe.  Normally, use a blank string
# like this:
PPPOE_EXTRA=""

# Rumour has it that "Citizen's Communications" with a 3Com
# HomeConnect DSL Modem DualLink requires these extra options:
# PPPOE_EXTRA="-f 3c12:3c13 -S ISP"

# Any extra arguments to pass to pppd.  Normally, use a blank string
# like this:
PPPD_EXTRA=""


########## DON'T CHANGE BELOW UNLESS YOU KNOW WHAT YOU ARE DOING
# If you wish to COMPLETELY overrride the pppd invocation:
# Example:
# OVERRIDE_PPPD_COMMAND="pppd call dsl"

# If you want pppoe-connect to exit when connection drops:
# RETRY_ON_FAILURE=no


```

* Reference: <http://www.cnblogs.com/zahuifan/p/3381091.html>


```
Type 'pppoe-setup' to configure the software.
root@OfficeRouter:~/rp-pppoe-3.10/src# pppoe-setup
Welcome to the Roaring Penguin PPPoE client setup.  First, I will run
some checks on your system to make sure the PPPoE client is installed
properly...

Looks good!  Now, please enter some information:

USER NAME

>>> Enter your PPPoE user name (default bxxxnxnx@sympatico.ca): tad

INTERFACE

>>> Enter the Ethernet interface connected to the DSL modem
For Solaris, this is likely to be something like /dev/hme0.
For Linux, it will be ethn, where 'n' is a number.
(default eth1): 

Do you want the link to come up on demand, or stay up continuously?
If you want it to come up on demand, enter the idle time in seconds
after which the link should be dropped.  If you want the link to
stay up permanently, enter 'no' (two letters, lower-case.)
NOTE: Demand-activated links do not interact well with dynamic IP
addresses.  You may have some problems with demand-activated links.
>>> Enter the demand value (default no): 

DNS

Please enter the IP address of your ISP's primary DNS server.
If your ISP claims that 'the server will provide DNS addresses',
enter 'server' (all lower-case) here.
If you just press enter, I will assume you know what you are
doing and not modify your DNS setup.
>>> Enter the DNS information here: 10.10.11.200
Please enter the IP address of your ISP's secondary DNS server.
If you just press enter, I will assume there is only one DNS server.
>>> Enter the secondary DNS server address here: 202.106.0.20

PASSWORD

>>> Please enter your PPPoE password:    
>>> Please re-enter your PPPoE password: 

FIREWALLING

Please choose the firewall rules to use.  Note that these rules are
very basic.  You are strongly encouraged to use a more sophisticated
firewall setup; however, these will provide basic security.  If you
are running any servers on your machine, you must choose 'NONE' and
set up firewalling yourself.  Otherwise, the firewall rules will deny
access to all standard servers like Web, e-mail, ftp, etc.  If you
are using SSH, the rules will block outgoing SSH connections which
allocate a privileged source port.

The firewall choices are:
0 - NONE: This script will not set any firewall rules.  You are responsible
          for ensuring the security of your machine.  You are STRONGLY
          recommended to use some kind of firewall rules.
1 - STANDALONE: Appropriate for a basic stand-alone web-surfing workstation
2 - MASQUERADE: Appropriate for a machine acting as an Internet gateway
                for a LAN
>>> Choose a type of firewall (0-2): 2

** Summary of what you entered **

Ethernet Interface: eth1
User name:          tad
Activate-on-demand: No
Primary DNS:        10.10.11.200
Secondary DNS:      202.106.0.20
Firewalling:        MASQUERADE

>>> Accept these settings and adjust configuration files (y/n)? y
Adjusting /etc/ppp/pppoe.conf
Adjusting /etc/resolv.conf
  (But first backing it up to /etc/resolv.conf-bak)
Adjusting /etc/ppp/pap-secrets and /etc/ppp/chap-secrets
  (But first backing it up to /etc/ppp/pap-secrets-bak)
  (But first backing it up to /etc/ppp/chap-secrets-bak)



Congratulations, it should be all set up!

Type 'pppoe-start' to bring up your PPPoE link and 'pppoe-stop' to bring
it down.  Type 'pppoe-status' to see the link status.
root@OfficeRouter:~/rp-pppoe-3.10/src# pppoe-start


```

* <http://blog.csdn.net/lenovo_/article/details/6640931>
* <http://blog.csdn.net/doudou02/article/details/6256908>
* <http://www.howtodoityourself.org/2010/12/01/pppoe-server-how-to-do-it-yourself.html>
* <http://hi.baidu.com/passprot/item/f71ae2e2b422970f8d3ea887>
* <http://network.51cto.com/art/201009/224642.htm>