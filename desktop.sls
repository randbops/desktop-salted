console-packages:
    pkg.installed:
        - pkgs:
            - ntp
            - silversearcher-ag
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
            - mpd
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

java-packages:
    pkg.installed:
        - pkgs:
            - openjdk-6-jdk
            - openjdk-6-source
            - openjdk-7-jdk
            - openjdk-7-source
            - scala
            - leiningen
            - maven

python-packages:
    pkg.installed:
        - pkgs:
            - python2.6
            - python2.7
            - python3.2
            - python3.3
            - virtualenvwrapper
            - fabric
            - python-mutagen
            - python-tox
            - python-nose
            - python-mock
            - python3-nose
            - python3-mock

graphical-packages:
    pkg.installed:
        - order: last
        - pkgs:
            - chromium
            - pidgin
            - wireshark

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
