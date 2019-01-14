

mc_python
Installs and configures multiple versions of Python. This cookbook does not attempt to configure or mutate the Python that ships with the Operating System. The initial use case for this cookbook is to install and configure Python on Jenkins build agents for build support.

This cookbook will install the following versions of Python:

2.7.4
3.6.4
All versions are installed into /sys_apps_01/python

Recipes
default
Install configure multiple python versions.

Pip
The cookbook will install and configure pip via /etc/pip.conf.

Configuration
The configuration will ensure dependencies are resolved from Artifactory.

Default Packages
Only the virtualenv package will be installed. Application teams can use this package to install packages into a virtual environment.

Environment
For convenience, an enviroment variable is created for all users named PYTHON_HOME. This variable will resolve to the root of the installation -> /sys_apps_01/python.

Python Source
This cookbook will install Python by using Mastercard pre-compiled packages. For more information on how these packages were compiled, please see:


