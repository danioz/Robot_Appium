adb devices
adb kill-server && adb start-server

appium --default-capabilities {\"adbPort\":5037,\"systemPort\":8201,\"newCommandTimeout\":0,\"automationName\":\"UiAutomator2\",\"udid\":\"emulator-5554\"}

appium --port 4725 --default-capabilities {\"adbPort\":5038,\"systemPort\":8202,\"newCommandTimeout\":0,\"automationName\":\"UiAutomator2\",\"udid\":\"emulator-5556\"}

robot -d Output --loglevel TRACE Tests\Open_Application.robot
robot -d Output --loglevel TRACE Tests\Login.robot
robot -d Output --loglevel TRACE Tests\Conversation.robot



adb uninstall io.appium.uiautomator2.server
adb uninstall io.appium.uiautomator2.server.test