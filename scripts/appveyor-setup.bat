@echo on

conda update -y -q conda
conda config --set auto_update_conda false
conda info -a

conda config --set show_channel_urls True

@rem Help with SSL timeouts to S3
conda config --set remote_connect_timeout_secs 12

conda config --add channels https://repo.continuum.io/pkgs/free
conda config --add channels conda-forge
conda info -a

@rem Use clcache for faster builds
pip install -q git+https://github.com/frerich/clcache.git
clcache -s
set CC=clcache
set CXX=clcache
set CLCACHE_SERVER=1
set CLCACHE_HARDLINK=1
powershell.exe -Command "Start-Process clcache-server"