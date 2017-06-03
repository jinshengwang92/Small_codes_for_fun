#!/bin/bash
# program
#     loop to take yes/YES using while do done techinique
# History
# 2017/05/15 Jinsheng    First edition

while [ "$yn" != "yes" -a "$yn" != "YES" ]
do
    read -p "Please input yes/YES to stop this program: " yn
done
echo "OK! you input the correct ansewer finally!"

# code ends here
