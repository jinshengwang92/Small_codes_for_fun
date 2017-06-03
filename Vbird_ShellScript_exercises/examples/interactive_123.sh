#!/bin/bash
# program
#    interactive with user to judge  $1.... by using case....esac
# History
# 2017/05/15  Jinsheng    First release

echo "This program will print out your selection {one|two|three}"
read -p "Input your choice: " choice
case $choice in
    "one")
        echo "Hello, your choice is ONE"
        ;;
    "two")
        echo "Hello, your choice is TWO"
        ;;
    "three")
        echo "Hello, your choice is THREE"
    ;;
    *)
        echo "Usage: $0 {one|two|three}"
        ;;
esac

