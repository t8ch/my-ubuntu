# my ubuntu configuration
my costumized configurations and settings for ubuntu

## general useful programs/packages
- mercurial and bzr (vc)
- clipit
- synapse
- inkscape (incl textext)
- tlp (https://askubuntu.com/questions/285434/is-there-a-power-saving-application-similar-to-jupiter)
- okular
- pdfpc
- jabref
- jupyter notebook plus extensions (TOC, multiple cursors, ...)

## smb.conf needs changes (sometimes)
protocol = SMB2


## emacs config
see  my-ubuntu/init.el
includes multiple lines editing (https://stackoverflow.com/questions/761706/in-emacs-edit-multiple-lines-at-once)

## python, anaconda and conda
parallel python 2 and 3 installations as environments (from https://github.com/jupyter/jupyter/issues/71#issuecomment-159927298 )
```
# install everything (except JupyterHub itself) with Python 2 and 3. Jupyter is included in Anaconda.
conda create -n py3 python=3 anaconda
conda create -n py2 python=2 anaconda
# register py2 kernel
source activate py2
ipython kernel install
# same for py3, and install juptyerhub in the py3 env
source activate py3
ipython kernel install
```
Import conda envs https://stackoverflow.com/questions/41274007/anaconda-export-environment-file
preparing hidrive for unison: https://hilkosblog.wordpress.com/2017/09/24/hidrive-synchronisieren-mit-nas/

backup /etc/ , too
auctex autocomplete
textext (inkscape plugin)
Jupyter kernels



https://www.omgubuntu.co.uk/2016/08/use-google-drive-ubuntu-16-04-linux-desktops
add hibernation (https://askubuntu.com/questions/768136/how-can-i-hibernate-on-ubuntu-16-04)


Emacs config
