# hardening-linux
Hardening a linux server

cd hardening-linux/
sudo puppet apply ./manifests/nodes/basenode.pp --modulepath=./modules/

Set APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE to one or any other no empty value to avoid warning in apt-key that causes than puppet fails.