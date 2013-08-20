#git push

`git push origin localBranchName:remoteBranchName`

#git pull
`git push origin remoteBranchName`

#git branch

* list branch 

`git branch`

* create new branch 

`git branch newBranchName`



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