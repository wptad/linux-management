#Mac

## Install and Use GNU Command Line Tools in Mac OS X

<http://www.topbug.net/blog/2013/04/14/install-and-use-gnu-command-line-tools-in-mac-os-x/>


## 快捷键

<http://jingyan.baidu.com/article/cbf0e500c8c17f2eaa2893ff.html>


##ulimit

```
launchctl limit maxfiles 2048 2048 
```

## Pageup pagedown

```fn+control+up```

## Kill all by name

```
ps -ef | grep PROCESS_NAME | grep -v "grep"| awk '{print $2}' | xargs -I {} kill {}

```

## select GCC version

* METHOD 1



```
in /usr/bin type

sudo ln -s -f g++-4.2 g++

sudo ln -s -f gcc-4.2 gcc

```

* METHOD 2

```
$ sudo port select --list gcc

Available versions for gcc:
gcc42
llvm-gcc42
mp-gcc46
none (active)
To set gcc to the MacPorts version:

$ sudo port select --set gcc mp-gcc46

```

* Refer: <http://stackoverflow.com/questions/837992/update-gcc-on-osx/838071#838071>

## xcode develop path


`sudo xcode-select -switch /Applications/Xcode.app`

* Reference: <http://stackoverflow.com/questions/11961032/xcrun-error-could-not-stat-active-xcode-path-volumes-xcode-xcode45-dp1-app-c>