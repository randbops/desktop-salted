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
            - git-svn
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
            - silversearcher-ag
            - cowsay
            - unrar
            - moc
            - imagemagick
            - mplayer2

libs:
    pkg.installed:
        - pkgs:
            - libpq-dev
            - libssl-dev
            - zlib1g-dev
            - libbz2-dev
            - libreadline-dev
            - libsqlite3-dev
            - tk-dev

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
            - python2.7-dev
            - python2.7-tk
            - python3
            - python3-dbg
            - python3-dev
            - python3-tk
            - python-mutagen

graphical-packages:
    pkg.installed:
        - order: last
        - pkgs:
            - pidgin
            - wireshark
            - network-manager-openvpn
            - virtualbox
            - mnemosyne

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
            - blin
            - sudo
            - adm
            - dialout
            - cdrom
            - dip
            - plugdev
            - lpadmin
            - sambashare

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

/home/blin/.pylintrc:
    file.managed:
        - require: [user: blin]
        - source: salt://configs/pylintrc
