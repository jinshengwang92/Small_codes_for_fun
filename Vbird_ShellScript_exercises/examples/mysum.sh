#!/bin/bash
# program
#     loop to calculate the sum from the firs value to the second one
# History
# 2017/05/15 Jinsheng    First edition

function mysum() {
    vstart=$(($1))
    vend=$(($2))
    thissum=0
    while [ "$vstart" -le "$vend" ]
    do 
        thissum=$(($thissum + $vstart))
        vstart=$(($vstart + 1))
    done
    echo "The calculated sum is $thissum"
}
read -p "Please input the start of the sum (Integer): " input1
read -p "Please input the end of the sum (Integer): " input2
mysum $input1 $input2
# code ends here
