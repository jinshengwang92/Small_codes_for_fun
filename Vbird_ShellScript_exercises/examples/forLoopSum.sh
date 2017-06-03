#!/bin/bash
# program
#     loop to calculate the sum from the firs value to the second one
# History
# 2017/05/15 Jinsheng    First edition

read -p "Please input the start of the sum (Integer): " input1
read -p "Please input the end of the sum (Integer): " input2

mysum=0

for((i=$input1; i<=$input2; i=i+1 ))
do
        mysum=$(($mysum+$i))
done
echo "The sum from $input1 to $input2 is $mysum."
# code ends here
