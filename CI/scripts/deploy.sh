set -e
set -o pipefail

echo "******************************************************************"
echo "*                          Archive                               *"
echo "******************************************************************"

xcodebuild -workspace GitHubUsersDemo.xcworkspace -scheme GitHubUsersDemo -archivePath build/archive/GitHubUsersDemo.xcarchive archive | xcpretty -c

echo "******************************************************************"
echo "*                          Export                                *"
echo "******************************************************************"

xcodebuild -exportArchive -archivePath build/archive/GitHubUsersDemo.xcarchive -exportPath build/ipa -exportOptionsPlist ./CI/scripts/exportOptions.plist

echo "******************************************************************"
echo "*                   Uploading to AppManager                      *"
echo "******************************************************************"