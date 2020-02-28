set -e
set -o pipefail

DESTINATION="platform=iOS Simulator,OS=11.3,name=iPhone X"

echo "******************************************************************"
echo "*                            Build                               *"
echo "******************************************************************"

xcodebuild -workspace GitHubUsersDemo.xcworkspace -scheme GitHubUsersDemo -destination "$DESTINATION" build analyze | xcpretty -c

echo "******************************************************************"
echo "*                            Unit Test                           *"
echo "******************************************************************"

xcodebuild build -workspace GitHubUsersDemo.xcworkspace -scheme GitHubUsersDemo -destination "$DESTINATION" test | xcpretty -c

