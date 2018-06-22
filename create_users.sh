#! /bin/bash


NUM_USERS=12
DEFAULT_SHELL=/bin/bash
DEFAULT_GROUP=curso_uwu
USER_PREFIX=coco

# Create the group
grep /etc/group -ie ${DEFAULT_GROUP} > /dev/null 2>&1
if [ $? -ne 0 ]; then
    groupadd ${DEFAULT_GROUP}
fi

for iter in $(seq -w 1 ${NUM_USERS}); do
    echo "Creating user: ${USER_PREFIX}${iter}"
    useradd -g ${DEFAULT_GROUP} --create-home --shell ${DEFAULT_SHELL} ${USER_PREFIX}${iter}
    echo "Changing passwd for user: ${USER_PREFIX}${iter}"
    echo -e "${USER_PREFIX}${iter}\n${USER_PREFIX}${iter}" | passwd ${USER_PREFIX}${iter} > /dev/null 2>&1
done

grep /etc/security/limits.conf -ie ${DEFAULT_GROUP} > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "@${DEFAULT_GROUP} hard nproc 100" >> /etc/security/limits.conf
    echo "@${DEFAULT_GROUP} soft nproc 50" >> /etc/security/limits.conf
fi
