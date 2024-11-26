#!/bin/bash
USERID=${USER_ID}
GROUPID=${GROUP_ID}
echo "Create User = $USERID. Group = $GROUPID"
groupadd -g $GROUPID dockeruser
useradd -m -s /bin/bash -u $USERID -g $GROUPID dockeruser
whoami
id
ls -la /app/logs
exec /usr/sbin/gosu $USERID "$@"
