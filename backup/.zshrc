# set screen window name
if [[ $TERM == "screen" ]]; then
    preexec() { echo -ne "\033k$1\033\\" }
fi

fortune | sed -e 's/america/amareica/g' -e 's/America/Amareica/g' -e 's/anybody/anypony/g' -e 's/Anybody/Anypony/g' -e 's/anyone/anypony/g' -e 's/Anyone/Anypony/g' -e 's/boy/colt/g' -e 's/Boy/Colt/g' -e 's/butthurt/saddle-sore/g' -e 's/Butthurt/Saddlesore/g' -e 's/children/foals/g' -e 's/Children/Foals/g' -e 's/child/foal/g' -e 's/Child/Foal/g' -e 's/cowboy/cowpony/g' -e 's/Cowboy/Cowpony/g' -e 's/cowgirl/cowpony/g' -e 's/Cowgirl/Cowpony/g' -e 's/gentlemen/gentlecolts/g' -e 's/Gentlemen/Gentlecolts/g' -e 's/everybody/everypony/g' -e 's/Everybody/Everypony/g' -e 's/everyone/everypony/g' -e 's/Everyone/Everypony/g' -e 's/feet/hooves/g' -e 's/Feet/Hooves/g' -e 's/folks/foalks/g' -e 's/Folks/Foalks/g' -e 's/fool/foal/g' -e 's/Fool/Foal/g' -e 's/foot/hoof/g' -e 's/Foot/Hoof/g' -e 's/girls/fillies/g' -e 's/Girls/Fillies/g' -e 's/girl/filly/g' -e 's/Girl/Filly/g' -e 's/halloween/nightmare night/g' -e 's/Halloween/Nightmare Night/g' -e 's/hands/hooves/g' -e 's/Hands/Hooves/g' -e 's/handed/hooved/g' -e 's/Handed/Hooved/g' -e 's/hand/hoof/g' -e 's/Hand/Hoof/g' -e 's/\bhey\b/hay/g' -e 's/\bHey\b/Hay/g' -e 's/humans/ponies/g' -e 's/Humans/Ponies/g' -e 's/human/pony/g' -e 's/Human/Pony/g' -e 's/ladies/fillies/g' -e 's/Ladies/Fillies/g' -e 's/main/mane/g' -e 's/Main/Mane/g' -e 's/woman/mare/g' -e 's/Woman/Mare/g' -e 's/women/mares/g' -e 's/Women/Mares/g' -e 's/\bman\b/stallion\ /g' -e 's/\bMan\b/Stallion/g' -e 's/\bmen\b/stallions/g' -e 's/\bMen\b/Stallions/g' -e 's/no\ one\ else/no\ pony\ else/g' -e 's/No\ one\ else/No\ pony\ else/g' -e 's/nobody/nopony/g' -e 's/Nobody/Nopony/g' -e 's/people/ponies/g' -e 's/People/Ponies/g' -e 's/person/pony/g' -e 's/Person/Pony/g' -e 's/philadelphia/fillydelphia/g' -e 's/Philadelphia/Fillydelphia/g' -e 's/somebody/somepony/g' -e 's/Somebody/Somepony/g' -e 's/tattoo/cutie\ mark/g' -e 's/Tattoo/Cutie\ mark/g' -e 's/the\ heck/the\ hay/g' -e 's/The\ heck/The hay/g' -e 's/the\ hell/the\ hay/g' -e 's/The\ Hell/The\ Hay/g' -e 's/troll/parasprite/g' -e 's/Troll/Parasprite/g' | ponysay -W 80

#DEBEMAIL="gurkan@phys.ethz.ch"; export DEBEMAIL
#DEBFULLNAME="Gürkan Sengün"; export DEBFULLNAME
EDITOR=nano; export EDITOR
export PS1='%n@%m:%~%(!.#.$) '
unset RPS1
HISTSIZE=1048576
SAVEHIST=1048576
HISTFILE=~/.history

# if you want to setup ssh key logins (and use ssh-add)
# ~/bin/sudo: cd $1; shift; if [ "x${1}" = "x" ]; then $SHELL; else $@; fi
#alias su='ssh -t root@$HOST ~/bin/sudo `pwd`'
#alias sudo='ssh -t root@$HOST ~/bin/sudo `pwd` 2>/dev/null'

alias less="less -r"

# man zshoptions
setopt nonomatch
setopt inc_append_history

if ! systemd-notify --booted; then # not using systemd
  start() {
    sudo rc.d start $1
  }

  restart() {
    sudo rc.d restart $1
  }

  stop() {
    sudo rc.d stop $1
  }
else
  start() {
    sudo systemctl start $1.service
  }

  restart() {
    sudo systemctl restart $1.service
  }

  stop() {
    sudo systemctl stop $1.service
  }

  enable() {
    sudo systemctl enable $1.service
  }

  status() {
    sudo systemctl status $1.service
  }

  disable() {
    sudo systemctl disable $1.service
  }
fi
