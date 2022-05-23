//
//  SettingsPage.swift
//  HackersUITests
//
//  Created by Nikita Berezin on 21.05.2022.
//  Copyright © 2022 Glass Umbrella. All rights reserved.
//

import XCTest

class SettingsPage: BasePageObjects {

    // MARK: - XCUIElements

    lazy var navigationTitle = app.navigationBars["Settings"]
    lazy var navigationDoneButton = app.navigationBars["Settings"].buttons.firstMatch

    lazy var settingsTitle = app.staticTexts["settingsTitle"]
    lazy var hackersOnGitLabel = app.staticTexts["hackersOnGitLabel"]
    lazy var sendFeedbackLabel = app.staticTexts["sendFeedbackLabel"]
    lazy var whatsNewLabel = app.staticTexts["whatsNewLabel"]

    lazy var usernameLabel = app.staticTexts["usernameLabel"]

    lazy var showThumbnailsLabel = app.staticTexts["showThumbnailsLabel"]
    lazy var showThumbnailsSwitch = app.switches["showThumbnailsSwitch"]
    lazy var swipeActionsLabel = app.staticTexts["swipeActionsLabel"]
    lazy var swipeActionsSwitch = app.switches["swipeActionsSwitch"]

    lazy var openInDefaultBrowserLabel = app.staticTexts["openInDefaultBrowserLabel"]
    lazy var openInDefaultBrowserSwitch = app.switches["openInDefaultBrowserSwitch"]
    lazy var safariReaderModeLabel = app.staticTexts["safariReaderModeLabel"]
    lazy var safariReaderModeSwitch = app.switches["safariReaderModeSwitch"]

    lazy var versionLabel = app.staticTexts["versionLabel"]

    lazy var loginTitle = app.staticTexts["loginTitle"]
    lazy var trustTitle = app.staticTexts["trustTitle"]
    lazy var usernameField = app.textFields["usernameField"]
    lazy var passwordField = app.secureTextFields["passwordField"]
    lazy var loginButton = app.buttons["loginButton"]
    lazy var registerButton = app.buttons["registerButton"]

}
