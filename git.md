# install


```
sudo apt-get install libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev build-essential
```

* <https://www.digitalocean.com/community/articles/how-to-install-git-on-ubuntu-12-04>
#global ignore

* Unix: 
```
git config --global core.excludesfile '~/.gitignore'
```

* Windows:

```
git config --global core.excludesfile "%USERPROFILE%\.gitignore"

```


#git push

`git push origin localBranchName:remoteBranchName`

#git pull
`git push origin remoteBranchName`




# Setup

* Git global setup:

```
  git config --global user.name "Tad Wang"
  git config --global user.email "wptad@tom.com"
```

* Create Repository

<pre>

mkdir test_empty
cd test_empty
git init
touch README
git add README
git commit -m 'first commit'
git remote add origin git@127.0.0.1:test_empty.git
git push -u origin master
</pre>

* Existing Git Repo?

<pre>
cd existing_git_repo
git remote add origin git@127.0.0.1:test_empty.git
git push -u origin master

</pre>

## SSH-KEYGEN
<pre>
  cd .ssh/
  ssh-keygen -t rsa -C "wptad@tom.com"
</pre>

## 放弃跟踪文件


有时候，你不希望某些文件或者文件夹被包含在Git仓库中。但是如果你把它们加到.gitignore文件中以后，Git会停止跟踪这个文件。但是它不会将这个文件从仓库中删除。这导致了文件或者文件夹的最后一个版本还是存在于仓库中。为了取消跟踪这些文件或者文件夹，你可以使用如下的命令

<pre>
# Remove directory .metadata from git repo
git rm -r --cached .metadata
# Remove file test.txt from repo
git rm --cached test.txt
</pre>

## Document
*[http://www.cnblogs.com/zhangjing230/archive/2012/05/09/2489745.html Git教程]
*[http://blog.prosight.me/index.php/2009/07/274 创建和修改项目]



# git issue

## perl warn

```
perl: warning: Setting locale failed.
perl: warning: Please check that your locale settings:
    LANGUAGE = (unset),
    LC_ALL = (unset),
    LC_TIME = "de_DE.UTF-8",
    LC_MONETARY = "de_DE.UTF-8",
    LC_ADDRESS = "de_DE.UTF-8",
    LC_TELEPHONE = "de_DE.UTF-8",
    LC_NAME = "de_DE.UTF-8",
    LC_MEASUREMENT = "de_DE.UTF-8",
    LC_IDENTIFICATION = "de_DE.UTF-8",
    LC_NUMERIC = "de_DE.UTF-8",
    LC_PAPER = "de_DE.UTF-8",
    LANG = "en_US.UTF-8"
    are supported and installed on your system.

```

* solutions

```
You've got several options:

Generate the locale. Generate the German locale on the server with sudo locale-gen de.

Stop forwarding locale from the client. Do not forward the locale environment variable from your local machine to the server. You can comment out the SendEnv LANG LC_* line in the local /etc/ssh/ssh_config file.

Stop accepting locale on the server. Do not accept the locale environment variable from your local machine to the server. You can comment out the AcceptEnv LANG LC_* line in the remote /etc/ssh/sshd_config file.

Set the server locale to English. Explicitly set the locale to English on the server. As an example, you can add the following lines to your remote ~/.bashrc or ~/.profile files:

export LANGUAGE="en"
export LANG="C"
export LC_MESSAGES="C"

```




## Add remote repository

```
git remote add origin git@211.154.172.172:gitdemo.git
```

## push to remote

```
git push -u origin master
```

# checkout 

* create branch_b based on branch_a

```
git checkout -b [branch_b] [branch_a]
```

* checkout remote branch

```
git checkout --track origin/branchName
```


# tag

* add tag

```
git tag -a '0.0.1' -m 'first tag'
```

* push single tag to remote

```
git push origin [tagname]
```

* push all tags to remote

```
git push [origin] --tags
```

* delete tag

```
git tag -d 0.1.3
```

* delete server tag

```
git push origin :refs/tags/0.1.3
```

# branch

* list branch 

```
git branch
```

* create local branch 

```
git branch [BranchName]
```

* create branch_b based on branch_a

```
git checkout -b [branch_b] [branch_a]
```

* switch branch

```
git checkout [branchName]
```

* push to remote branch

```
git push origin [branchName]
```

OR

```
git push origin [localBranchName]:[remoteBranchName]
```

* checkout remote branch & switch to that branch

```
git checkout --track origin/[branchName]
```

* remove local branch

```
git branch -d [branchName]
```


* remove remote branch

```
git push origin :[branchName]
```

* sync remote deleted branch

```
git fetch -p
```

* rename local branch

```
git branch -m old_branch_name new_branch_name
```

* rename remote branch

```
git branch -m master master-old
git push remote :master # delete master
git push remote master-old # create master-old on remote
git checkout -b master some-ref # create a new local master
git push remote master # create master on remote

```

# merge

* merge branch `hotfix` to `master`

```
git checkout master
git merge --no-ff hotfix
``` 

* 全局添加--no-ff

```
git config --global --add merge.ff false

```

* refer: <http://stackoverflow.com/questions/2500296/can-i-make-fast-forwarding-be-off-by-default-in-git>


# stash

* backup present workstage

```
git stash
```

* restore recent stash

```
git stash pop
```

* list all stashes

```
git stash list
```

* clean git stash

```
git stash clear
```


# reset

```
    git reset --hard <commit_id>
    git push origin HEAD --force
```


```
    根据–soft –mixed –hard，会对working tree和index和HEAD进行重置:
    git reset –mixed：此为默认方式，不带任何参数的git reset，即时这种方式，它回退到某个版本，只保留源码，回退commit和index信息
    git reset –soft：回退到某个版本，只回退了commit的信息，不会恢复到index file一级。如果还要提交，直接commit即可
    git reset –hard：彻底回退到某个版本，本地的源码也会变为上一个版本的内容


    HEAD 最近一个提交
    HEAD^ 上一次
    <commit_id>  每次commit的SHA1值. 可以用git log 看到,也可以在页面上commit标签页里找到.

```

# remote setting

* set remote head

```
 git remote set-head origin master
```

* show status of remote

```
git remote show origin
```

* delete remote master from server
* <http://danielcsgomes.com/tutorials/how-to-allow-remove-master-branch-from-git/#.U3BZpK2SxhU>


```
git push origin :master
 
remote: error: By default, deleting the current branch is denied, because the next
 
remote: error: 'git clone' won't result in any file checked out,
causing confusion.
remote: error:
remote: error: You can set 'receive.denyDeleteCurrent' configuration variable to
remote: error: 'warn' or 'ignore' in the remote repository to allow deleting the
remote: error: current branch, with or without a warning message.
remote: error:
remote: error: To squelch this message, you can set it to 'refuse'.
remote: error: refusing to delete the current branch: refs/heads/master
To ssh://server_name/git/repository.git
! [remote rejected] master (deletion of the current branch prohibited)
error: failed to push some refs to 'ssh://server_name/git/repository.git'

```

By default the git server does not allow to delete the current branch (usually is the master branch) , but you can change this behavior by doing the following steps:

```
ssh git_server_ip -l root
sudo -u git_user git config --system receive.denyDeleteCurrent warn
sudo -u git_user git config --global receive.denyDeleteCurrent warn

```

# revert

* only revsert specific commit

```
git revert HEAD~3
```

# git stats generator

* http://gitstats.sourceforge.net/

```
git clone git://github.com/hoxu/gitstats.git

```


# git model


* 原文：<http://nvie.com/posts/a-successful-git-branching-model/>
* 翻译：<http://www.oschina.net/translate/a-successful-git-branching-model>



