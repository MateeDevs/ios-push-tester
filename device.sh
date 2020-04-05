#!/bin/bash

cd "$(dirname "$0")"

usage() {
cat << EOF
USAGE:
    $0 fcm_key device_token

DESCRIPTION:
    Send a predefined push notification to a real device.

    fcm_key - Firebase server key token (retrieve from Firebase console).
    device_token - Firebase messaging registration token (retrieve from didReceiveRegistrationToken).

AUTHOR:
    Petr Chmelar<petr.chmelar@matee.cz>

LICENSE:
    This script follow MIT license.

EXAMPLE:
    $0 key token
EOF
}

# Load inputs
FCM_KEY="$1"
DEVICE_TOKEN="$2"

# Check param
if [ $# != 2 ];then
    usage
    exit -1
fi

# Send notification
curl --header "Authorization: key=${FCM_KEY}" --header Content-Type:"application/json" https://fcm.googleapis.com/fcm/send -d "{\"content_available\":true,\"to\":\"${DEVICE_TOKEN}\",\"priority\":\"high\",\"notification\":{\"title\":\"User updated\",\"body\":\"Click for more details\"},\"data\":{\"type\":\"2\",\"entity_id\":\"5c1a3d7b4a74580016faadf8\"}}"
