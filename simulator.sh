#!/bin/bash

cd "$(dirname "$0")"

usage() {
cat << EOF
USAGE:
    $0 bundle_id apns_file

DESCRIPTION:
    Send a given push notification to a running simulator.

    bundle_id - Bundle identifier of the app to be notified.
    apns_file - Path to an APNS file.

AUTHOR:
    Petr Chmelar<petr.chmelar@matee.cz>

LICENSE:
    This script follow MIT license.

EXAMPLE:
    $0 cz.matee.devstack.alpha info.apns
EOF
}

# Load inputs
BUNDLE_ID="$1"
APNS_FILE="$2"

# Check param
if [ $# != 2 ];then
    usage
    exit -1
fi

# Send notification
xcrun simctl push booted $BUNDLE_ID $APNS_FILE
