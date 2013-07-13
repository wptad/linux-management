#Mac


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

