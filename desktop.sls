console-packages:
    pkg.installed:
        - pkgs:
            - gvim
            - pwgen
            - wget
            - mercurial
            - openssh
            - rsync
            - alsa-utils
            - git
            - mpd
            - mpc
            - ncmpcpp
            - tree
            - python
            - python2
            - jre7-openjdk-headless
            - keychain

graphical-packages:
    pkg.installed:
        - order: last
        - pkgs:
            - xorg-server
            - xorg-server-utils
            - xorg-xinit
            - wireshark-gtk
            - dmenu
            - chromium
            - firefox
            - thunderbird
            - pidgin
            - terminus-font
            
sudo:
    pkg:
        - installed
    file.managed:
        - name: /etc/sudoers
        - source: salt://configs/sudoers
        - user: root
        - mode: 400

ntp:
    pkg:
        - installed
    service:
        - name: ntpd
        - enable: True
        - running

zsh:
    pkg.installed
grml-zsh-config:
    pkg.installed
/home/blin/.zshrc:
    file.symlink:
        - require: [pkg: grml-zsh-config, user: blin]
        - target: /etc/zsh/zshrc
/home/blin/.zshrc.local:
    file.managed:
        - require: [user: blin]
        - source: salt://configs/zshrc.local

blin:
    user.present:
        - require: [pkg: zsh]
        - shell: /bin/zsh
        - home: /home/blin
        - groups:
            - wheel
            - adm
            - power
            - systemd-journal
            - uucp

terminator:
    pkg:
        - installed
    file.managed:
        - name: /home/blin/.config/terminator/config
        - require: [user: blin]
        - source: salt://configs/terminator

/home/blin/.hgrc:
    file.managed:
        - require: [user: blin]
        - source: salt://configs/hg/hgrc
/home/blin/.hgignore:
    file.managed:
        - require: [user: blin]
        - source: salt://configs/hg/hgignore

/home/blin/.gitconfig:
    file.managed:
        - require: [user: blin]
        - source: salt://configs/git/gitconfig
/home/blin/.gitignore:
    file.managed:
        - require: [user: blin]
        - source: salt://configs/git/gitignore

/home/blin/.vimrc:
    file.managed:
        - require: [user: blin]
        - source: salt://configs/vimrc

openbox:
    pkg.installed:
        - name: openbox-multihead-git
/home/blin/.config/openbox/rc.xml:
    file.managed:
        - require: [user: blin, pkg: openbox]
        - source: salt://configs/openbox-rc.xml
