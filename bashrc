function gitbranchcolor {
GITBR=$(git branch 2>/dev/null | grep '^*' | colrm 1 2)
if [[ ! -z $GITBR ]]
  then
    if [[ $GITBR == "master" ]]
            then
              echo -e "\e[31m($GITBR)\e[0m"
      else
        let x=`ascii -s ${GITBR} | awk '{sum+=$2;}END{print sum;}'`
        let GITBR_CLR="$x%5 + 32"
              echo -e "\e[${GITBR_CLR}m($GITBR)\e[0m"
    fi
fi
}

#PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(gitbranchcolor)\$ '
PS1='\[\033[01;32m\]\u:\[\033[01;34m\]\w\[\033[00m\]$(gitbranchcolor)\$ '

alias ansible='ansible -e "ansible_python_interpreter=/usr/bin/env python"'
alias ansible-playbook='ansible-playbook -e "ansible_python_interpreter=/usr/bin/env python"'
