#git push

`git push origin localBranchName:remoteBranchName`

#git pull
`git push origin remoteBranchName`

#git branch

* list branch 

`git branch`

* create new branch 

`git branch newBranchName`



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


#gitstats


* <http://gitstats.sourceforge.net/>




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