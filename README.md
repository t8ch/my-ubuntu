# my ubuntu configuration
my costumized configurations and settings for ubuntu

## general useful programs/packages
- mercurial and bzr (vc)
- clipit
- synapse
- inkscape (incl textext)
- tlp (https://askubuntu.com/questions/285434/is-there-a-power-saving-application-similar-to-jupiter)
- okular (to make work with emacs: go to the "Settings" menu, item "Configure Okular", "Editor", select Emacs client.)
- pdfpc
- jabref
- gimp and g'mic (http://ubuntuhandbook.org/index.php/2017/06/install-gmic-2-0-via-ppa-in-ubuntu-16-04-14-04-higher/)
  - beautify: https://github.com/hejiann/beautify/blob/master/README (and https://askubuntu.com/questions/1073833/unable-to-install-beautify-plugin-in-gimp-2-10-6 for installation)
- jupyter notebook plus extensions (TOC, multiple cursors, ...)
- add hibernation (https://askubuntu.com/questions/768136/how-can-i-hibernate-on-ubuntu-16-04)

## smb.conf needs changes (sometimes)
protocol = SMB2


## emacs config
see [init.el](https://github.com/t8ch/my-ubuntu/edit/master/init.el)
includes multiple lines editing (https://stackoverflow.com/questions/761706/in-emacs-edit-multiple-lines-at-once)

## python, anaconda and conda
- parallel python 2 and 3 installations as environments (from https://github.com/jupyter/jupyter/issues/71#issuecomment-159927298 )
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
- choose between kernels in jupyter notebooks: https://stackoverflow.com/a/30492913
- jupytext: edit notebooks in custom editor (https://github.com/mwouts/jupytext)
  - integrate pip installation in conda env: https://www.puzzlr.org/install-packages-pip-conda-environment/
  - possibly run "conda install nb_conda_kernels" afterwards
- some other modifications that seem to be necessary when installing new environment (example tf2-alpha)
```
conda create -n tf2 pip python=3.6
source activate tf2

pip install tf-nightly-2.0-preview tfp-nightly

python -m ipykernel install --user --name myenv

conda install -c conda-forge jupytext
conda install nbconvert notebook
```

## mount HiDrive and google drive as network file systems
- hidrive: https://hilkosblog.wordpress.com/2017/09/24/hidrive-synchronisieren-mit-nas/
- google: https://www.omgubuntu.co.uk/2016/08/use-google-drive-ubuntu-16-04-linux-desktops
