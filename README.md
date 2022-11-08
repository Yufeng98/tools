## Move docker volume to another disk
https://www.guguweb.com/2019/02/07/how-to-move-docker-data-directory-to-another-location-on-ubuntu/

## SSH configuration
https://www.cyberciti.biz/faq/force-ssh-client-to-use-given-private-key-identity-file/

## Manage gcc/g++ version
https://linuxconfig.org/how-to-switch-between-multiple-gcc-and-g-compiler-versions-on-ubuntu-20-04-lts-focal-fossa

## ImageNet validation labels
https://github.com/microsoft/Swin-Transformer/issues/195

## libstdc++.so.6: version `GLIBCXX_3.4.30' not found
https://stackoverflow.com/questions/72540359/glibcxx-3-4-30-not-found-for-librosa-in-conda-virtual-environment-after-tryin

## Docker access from vscode
https://stackoverflow.com/questions/52364905/after-executing-following-code-of-dockerode-npm-getting-error-connect-eacces-v

## error while loading shared libraries: libssl.so.1.0.0
wget "http://security.ubuntu.com/ubuntu/pool/main/o/openssl1.0/libssl1.0.0_1.0.2n-1ubuntu5.10_amd64.deb"
sudo dpkg -i libssl1.0.0_1.0.2n-1ubuntu5.10_amd64.deb

## RDT Allocation error
Write RDT_IFACE=MSR in /etc/environment
sudo modprobe msr
sudo rm /var/lock/libpqos
