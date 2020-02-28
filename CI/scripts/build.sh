set -e
set -o pipefail

DESTINATION="platform=iOS Simulator,OS=13.3,name=iPhone 11"

echo "******************************************************************"
echo "*                            Build                               *"
echo "******************************************************************"

xcodebuild -workspace GitHubUsersDemo.xcworkspace -scheme GitHubUsersDemo -destination "$DESTINATION" build analyze | xcpretty -c

echo "******************************************************************"
echo "*                            Unit Test                           *"
echo "******************************************************************"

xcodebuild build -workspace GitHubUsersDemo.xcworkspace -scheme GitHubUsersDemo -destination "$DESTINATION" test | xcpretty -c

