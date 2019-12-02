function gitbranchcolor {
GITBR=$(git branch 2>/dev/null | grep '^*' | colrm 1 2)
if [[ ! -z $GITBR ]]
  then
    if [[ $GITBR == "master" ]]
            then
              echo -e "\e[31m($GITBR)\e[0m"
      else
        let x+=`ascii -s ${GITBR:0:1} | awk '{print $2}'`
        let GITBR_CLR="$x%5 + 31"
              echo -e "\e[${GITBR_CLR}m($GITBR)\e[0m"
    fi
fi
}

PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(gitbranchcolor)\$ '
