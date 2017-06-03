#!/bin/bash
# program
#    show Hello from $1.... by using case....esac
#    with the application of easy funcion
# History
# 2017/05/15  Jinsheng    First release

# the funciton should be deployed at the beginning of this script
function printit() {
    echo -n "Hello, your choice is "  
    # -n flag enables the display within the same line
}
case $1 in
    "one")
        printit; echo $1 | tr 'a-z' 'A-Z'   # lower case to upper case
        ;;
    "two")
        printit; echo $1 | tr 'a-z' 'A-Z'
        ;;
    'three')
        printit; echo $1 | tr 'a-z' 'A-Z'
        ;;
    *)
        echo "Usage $0 {one|two|three}"
        ;;
esac

