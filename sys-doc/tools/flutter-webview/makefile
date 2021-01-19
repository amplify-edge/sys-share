# https://github.com/dint-dev/web_node



LIB_NAME=web_node
LIB=github.com/dint-dev/$(LIB_NAME)

print:
	@echo
	@echo LIB: $(LIB)

dep:
	git clone https://$(LIB)
dep-delete:
	rm -rf $(LIB_NAME)




flu-print:
	flutter devices
	flutter config

flu-init:
	# upgrades anything needed in the code.
	cd $(LIB_NAME)/example && flutter create .

	# I did not need this, but we might 
	# sudo gem install cocoapods


flu-web:
	# Works and allows right click to open web view in new tab.
	cd $(LIB_NAME)/example && flutter run -d Chrome

flu-desktop:
	# Mac
	cd $(LIB_NAME)/example && flutter run -d macOS

	# Errors with: "Unsupported operation: Trying to use the default webview implementation for TargetPlatform.macOS but there isn't a default one"
	# Issue: https://github.com/flutter/flutter/issues/41725
	# WorkAround is: https://github.com/vanelizarov/flutter_macos_webview

	# Windows: Need to get another dev to test, as i dont have windows.

flu-mobile-init:
	# first change signing identity so you can run on real ios.
	cd $(LIB_NAME)/example && open ios/Runner.xcworkspace
flu-mobile:
	# IOS works
	cd $(LIB_NAME)/example && flutter run -d iPhone
	
	# Android: Need to test on android, when i get a cable :)