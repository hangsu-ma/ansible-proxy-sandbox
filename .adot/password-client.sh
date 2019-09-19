#!/bin/bash
# ansible-vault password client script, returning password based on vault id
# where a file name match vault id, the clear text content of the file will be returned and used as password
# if no such file exists, returns vault id as password instead of return with error or warning message,
# this is due to a ansible vault constrains
if [ -f /etc/ansible/secrets/$2 ]; then
    cat /etc/ansible/secrets/$2
else
    echo $2
fi