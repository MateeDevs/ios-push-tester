# iOS push tester
This repository contains Bash scripts for testing push notifications in iOS apps.

## Scripts
| Script       | Description                                           |
|--------------|-------------------------------------------------------|
| device.sh    | Send a predefined push notification to a real device  |
| simulator.sh | Send a given push notification to a running simulator |

## Example payloads
| Payload         | Description                                       |
|-----------------|---------------------------------------------------|
| info.apns       | Basic notification with title and body            |
| userDetail.apns | Notification with an entity id for deeplink tests |
