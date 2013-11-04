#Mac

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



## xcode develop path


`sudo xcode-select -switch /Applications/Xcode.app`

* Reference: <http://stackoverflow.com/questions/11961032/xcrun-error-could-not-stat-active-xcode-path-volumes-xcode-xcode45-dp1-app-c>