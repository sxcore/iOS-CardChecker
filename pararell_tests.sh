	xcodebuild \
	-workspace CCNumberValidator.xcworkspace \
	-scheme CCNumberValidator \
	-sdk iphonesimulator \
	-destination 'platform=iOS Simulator,name=iPhone SE,OS=11.2' \
	-destination 'platform=iOS Simulator,name=iPhone 8,OS=11.2' \
	-destination 'platform=iOS Simulator,name=iPhone 8 Plus,OS=11.2' \
	-destination 'platform=iOS Simulator,name=iPhone X,OS=11.2' \
	test | xcpretty -c