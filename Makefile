setup-tools:
	@./script/tools.sh

setup-git-hooks:
	@cp -p ./script/pre-commit .git/hooks/
	@chmod u+x .git/hooks/pre-commit

swiftlint:
	@mint run realm/SwiftLint swiftlint

swiftformat-diff:
	@./script/swiftformat.sh

install-carthage:
	@mint run Carthage/Carthage carthage bootstrap --platform ios --use-ssh --cache-builds

update-carthage:
	@mint run Carthage/Carthage carthage update --platform ios --use-ssh --cache-builds

xcodegen:
	@mint run yonaskolb/XcodeGen xcodegen generate

open-xcode:
	@open QiitaVIPER.xcodeproj

delete-xcode:
	@rm -rf QiitaVIPER.xcodeproj
	@sleep 1.5s

close-xcode:
	@osascript script/close-xcode.scpt

reopen: close-xcode delete-xcode xcodegen open-xcode

setup: setup-tools setup-git-hooks install-carthage
