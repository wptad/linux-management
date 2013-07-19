#Ubuntu
## install from USB 

* USB installer
<http://www.pendrivelinux.com/downloads/Universal-USB-Installer/Universal-USB-Installer-1.9.3.7.exe>

* winodws chksum tool

<http://jaist.dl.sourceforge.net/project/winchksum/winchksum-1.0/winchksum.exe>

* download link for 12.04.2

<http://releases.ubuntu.com/12.04/ubuntu-12.04.2-desktop-amd64.iso.torrent>

## change root password

1. `Shift` key
2. Select Recovery 
3. `e` to edit
4. 修改启动参数,将后面的`ro single`改为`rw single init=/bin/bash`
5. `passwd` root passwd
6. 
* Reference <http://www.linuxidc.com/Linux/2008-04/12123.htm>