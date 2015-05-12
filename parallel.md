## parallel

* reference: <https://en.wikipedia.org/wiki/GNU_parallel>


### example

```
ls -1 -d /hdd1/log/2015/* |parallel -X rsync -abv --remove-source-files {} /hdd2/log/2015/

``` 
