#!/bin/bash

var=$(date -I)

#clone gitlab repo via https
git clone https://ucb.bootcampcontent.com/UCB-Coding-Bootcamp/ucb-bel-cyber-pt-06-2020-u-c.git 

echo -e "\n*********************************\nMoving to Drive\n*********************************\n"

#move to google drive
mv ./ucb-bel-cyber-pt-06-2020-u-c "/c/Users/sthiv/google drive/ucb cyber bootcamp/gitrepo"

echo -e "\n*********************************\nRenaming\n*********************************\n"

#rename with date of clone
mv "/c/Users/sthiv/google drive/ucb cyber bootcamp/gitrepo/ucb-bel-cyber-pt-06-2020-u-c" "/c/Users/sthiv/google drive/ucb cyber bootcamp/gitrepo/$var-ucb-bel-cyber-pt-06-2020-u-c" 

echo -e "\n*********************************\nCopy to D/UCB_Repository\n*********************************\n"

#copy to local external drive
cp -r "/c/Users/sthiv/google drive/ucb cyber bootcamp/gitrepo/$var-ucb-bel-cyber-pt-06-2020-u-c" "/d/UCB_Repository"

echo -e "\n*********************************\nDONE\n*********************************\n"

exit
