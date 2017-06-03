#! /bin/bash
# Program
#     User input dir name, then ouput the permissions of files inside
# History
# 2017/05/15  Jinsheng    First Release

# first check whether the dir exists or not
read -p "Please input a direcory name: " dir
if [ "$dir" == "" -o ! -d "$dir" ]; then
        echo "The $dir does NOT exit in this system."
        exit 1
fi

# if the directory exists, test the files inside
filelists=$( ls $dir)
for filename in $filelists
do
        perm=""
        test -r "$dir/$filename" && perm="$perm readable"
        test -w "$dir/$filename" && perm="$perm writable"
        test -x "$dir/$filename" && perm="$perm executable"
        echo "The file $dir/$filename 's permission is $perm "
done
