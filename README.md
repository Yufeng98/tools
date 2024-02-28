## Move docker volume to another disk
https://www.guguweb.com/2019/02/07/how-to-move-docker-data-directory-to-another-location-on-ubuntu/

## Docker commands
```
docker build prune    # remove docker build cache
```

## SSH configuration
https://www.cyberciti.biz/faq/force-ssh-client-to-use-given-private-key-identity-file/

## Manage gcc/g++ version
https://linuxconfig.org/how-to-switch-between-multiple-gcc-and-g-compiler-versions-on-ubuntu-20-04-lts-focal-fossa

## ImageNet validation labels
https://github.com/microsoft/Swin-Transformer/issues/195

## libstdc++.so.6: version `GLIBCXX_3.4.30' not found
https://stackoverflow.com/questions/72540359/glibcxx-3-4-30-not-found-for-librosa-in-conda-virtual-environment-after-tryin
```bash
cd /home/ubuntu/anaconda3/envs/tensorflow_p36/lib
mv libstdc++.so.6 libstdc++.so.6.old
ln -s /usr/lib/x86_64-linux-gnu/libstdc++.so.6 libstdc++.so.6
```

## Docker access from vscode
https://stackoverflow.com/questions/52364905/after-executing-following-code-of-dockerode-npm-getting-error-connect-eacces-v

## error while loading shared libraries: libssl.so.1.0.0
```bash
wget "http://security.ubuntu.com/ubuntu/pool/main/o/openssl1.0/libssl1.0.0_1.0.2n-1ubuntu5.10_amd64.deb"
sudo dpkg -i libssl1.0.0_1.0.2n-1ubuntu5.10_amd64.deb
```

## RDT Allocation error
Write RDT_IFACE=MSR in /etc/environment
```bash
sudo modprobe msr
sudo rm /var/lock/libpqos
```

## folk repo privately
https://stackoverflow.com/questions/10065526/github-how-to-make-a-fork-of-public-repository-private

## Matplotlib linestyle and color cheatsheet
https://matplotlib.org/stable/gallery/lines_bars_and_markers/linestyles.html
https://matplotlib.org/stable/gallery/color/named_colors.html

## Kill specific commands
```bash
ps aux | grep <command> | grep -v "grep" | awk '{print $2}' | xargs kill
```

## Zerotier
```bash
# Install Zerotier on Linux
curl -s https://install.zerotier.com/ | sudo bash
sudo service zerotier-one start
```
restart Zerotier
https://zerotier.atlassian.net/wiki/spaces/SD/pages/327693/How+to+Clear+Reset+your+ZeroTier+Address

## MacOS Clang cannot link libc++
```
export LDFLAGS=-L/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib
```

## Linux commands
```
sudo useradd bob
sudo passwd username
sudo mkhomedir_helper bob
usermod -aG sudo bob
chown tom:tom /home/tom
chmod 755 /home/tom
```

## VNC configuration
https://www.tecmint.com/install-and-configure-vnc-server-in-centos-7/

## HP ML350p Gen8 mount new disk
F8 to configure RAID of new disk
https://unix.stackexchange.com/questions/315063/mount-wrong-fs-type-bad-option-bad-superblock/315070#315070
```bash
sudo mkfs.ext4 /dev/sdX
sudo mkdir /data#
sudo mount /dev/sdX /data#
```
