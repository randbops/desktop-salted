console-packages:
    pkg.installed:
        - pkgs:
            - ntp
            - sudo
            - lm-sensors
            - feh
            - curl
            - postgresql-client
            - realpath
            - ranger
            - pwgen
            - wget
            - mercurial
            - rsync
            - subversion
            - git
            - tree
            - mpc
            - ncmpcpp
            - htop
            - devscripts
            - ruby
            - graphviz
            - mc
            - vim-gtk
            - tcpdump
            - exuberant-ctags
            - smbclient
            - enca
            - recode
            - xfonts-terminus

java-packages:
    pkg.installed:
        - pkgs:
            - openjdk-7-jdk
            - openjdk-7-source
            - maven

python-packages:
    pkg.installed:
        - pkgs:
            - python2.7
            - python2.7-dbg
            - python3
            - python3-dbg
            - virtualenvwrapper
            - python-mutagen

graphical-packages:
    pkg.installed:
        - order: last
        - pkgs:
            - pidgin
            - wireshark
            - network-manager-openvpn
            - virtualbox

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
            - sudo
            - adm
            - dialout

terminator:
    pkg:
        - installed
    file.managed:
        - name: /home/blin/.config/terminator/config
        - require: [user: blin]
        - source: salt://configs/terminator

mpd:
    pkg:
        - installed
/home/blin/.mpdconf:
    file.managed:
        - require: [user: blin]
        - source: salt://configs/mpdconf
/home/blin/.config/autostart/mpd.desktop:
    file.managed:
        - require: [user: blin]
        - source: salt://configs/mpd-autostart

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
