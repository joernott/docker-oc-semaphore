#!/bin/bash
set -e
set -x
chmod a+rwx /tmp
source /tmp/install/functions.sh

install_software git wget curl ca-certificates
create_user_and_group
cleanup
