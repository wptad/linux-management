#dns

## dig install

```
apt-get install dnsutils
```


## clean DNS cache

Overview

### Windows® 8

* Press `Win+X` to open the `WinX Menu`.
* Right-click on `Command Prompt` and select `Run as Administrator`.
* Type the following command and press Enter: `ipconfig /flushdns`
* If the command was successful, you will see the following message:

```
Windows IP configuration successfully flushed the DNS Resolver Cache.
```

### Windows 7

* Click the `Start` button.
* Enter `cmd` in the `Start` menu search field.
* Right-click on `Command Prompt` and select `Run as Administrator`.
* Type the following command and press Enter: `ipconfig /flushdns`
* If the command was successful, you will see the following message:

```
Windows IP configuration successfully flushed the DNS Resolver Cache.
```

### Windows XP, 2000, or Vista®
* Click the `Start` button.
* On the `Start` menu, click `Run`....
* * If you do not see the Run command in Vista, enter `run` in the Search bar.
* Type the following command in the Run text box: ipconfig /flushdns

### MacOS® 10.7 and 10.8
* Click `Applications`.
* Click `Utilities`.
* Double-click the `Terminal` application.
* Type the following command:

```
sudo killall -HUP mDNSResponder
```

* ALERT! Warning: To run this command, you will need to know the computer's Admin account password.

### MacOS 10.5 and 10.6
* Click `Applications`.
* Click `Utilities`.
* Double-click the `Terminal` application.
* Type the following command: `sudo dscacheutil -flushcache`


### chrome

* chrome://net-internals/#dns



#Reference

* <http://docs.cpanel.net/twiki/bin/view/AllDocumentation/ClearingBrowserCache>
