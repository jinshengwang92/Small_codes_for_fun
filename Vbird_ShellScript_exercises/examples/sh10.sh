#!/bin/bash
# program:
#    Using netstat and grep to detect www,ssh, ftp and mail services
# History:
# 2017/05/15 Jinsheng    First release

# First to print out some program info
echo "Now, I will detect this Linux server's services!"
echo -e "The www, ftp, ssh, and mail will be detected! \n"

# Perform the testing and output some results below
testing=$(netstat -tuln | grep ":80")  # test whether port 80 exits or not
if [ "$testing" != "" ]; then
    echo "WWW is running in your system."
else
    echo "WWW is not running in your system."
fi

testing=$(netstat -tuln | grep ":22")    # test port 22
if [ "$testing" != "" ]; then
    echo "SSH is running in your system."
else
    echo "SSH is not running in your system."
fi

testing=$(netstat - tuln | grep ":21")    # test port 21
if [ "$testing" != "" ]; then
    echo "FTP is running in your system."
else
    echo "FTP is not running in your system."
fi

testing=$(netstat -tuln | grep ":25")    # test port 25
if [ "$testing" != "" ]; then
    echo "Mail is running in your system."
else
    echo "Mail is not running in your system."
fi
