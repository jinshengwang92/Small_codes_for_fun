#!/bin/bash
# program
#    show Hello from $1.... by using case....esac
# History
# 2017/05/15  Jinsheng    First release

case $1 in
    "hello")
        echo "Hello, how are you ?"
        ;;
    "")
        echo "You must input parameters, ex> {$0 someword}"
        ;;
    *)
        echo "Usage $0 {hello}"
        ;;
esac

