console-packages:
    pkg.installed:
        - pkgs:
            - lm-sensors
            - feh
            - curl
            - postgresql-client
            - maven
            - realpath
            - openjdk-7-jdk
            - ranger
            - pwgen
            - wget
            - mercurial
            - rsync
            - subversion
            - git
            - tree
            - mpd
            - mpc
            - ncmpcpp
            - htop
            - scala
            - leiningen
#            - python
#            - python2
#            - gvim
#            - keychain
#            - openssh
#            - alsa-utils
#
graphical-packages:
    pkg.installed:
        - order: last
        - pkgs:
            - chromium-browser
            - firefox
            - thunderbird
            - pidgin
#            - wireshark-gtk
#            - dmenu
#            - terminus-font
            
sudo:
    pkg:
        - installed
    file.managed:
        - name: /etc/sudoers
        - source: salt://configs/sudoers
        - user: root
        - mode: 400

#ntp:
#    pkg:
#        - installed
#    service:
#        - name: ntpd
#        - enable: True
#        - running

zsh:
    pkg.installed
/home/blin/.zshrc:
    file.managed:
        - require: [user: blin]
        - source: salt://configs/zshrc
/home/blin/.zshrc.local:
    file.managed:
        - require: [user: blin]
        - source: salt://configs/zshrc.local

blin:
    user.present:
        - home: /home/blin
        - shell: /bin/zsh
        - groups:
            - adm

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
