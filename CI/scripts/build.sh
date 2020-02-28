set -e
set -o pipefail

DESTINATION="name=iPhone 8 Plus"

echo "******************************************************************"
echo "*                            Build                               *"
echo "******************************************************************"

xcodebuild -workspace GitHubUsersDemo.xcworkspace -scheme GitHubUsersDemo -destination "$DESTINATION" build analyze | xcpretty -c

echo "******************************************************************"
echo "*                            Unit Test                           *"
echo "******************************************************************"

xcodebuild build -workspace GitHubUsersDemo.xcworkspace -scheme GitHubUsersDemo -destination "$DESTINATION" test | xcpretty -c

