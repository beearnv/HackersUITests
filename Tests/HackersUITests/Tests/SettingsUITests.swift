//
//  SettingsUITests.swift
//  HackersUITests
//
//  Created by Nikita Berezin on 22.05.2022.
//  Copyright © 2022 Glass Umbrella. All rights reserved.
//

import XCTest

class SettingsUITests: BaseTestCase {

    // MARK: - Tests

    func testSettingsUI() {
        launch(disableOnboarding: true)

        let feedsPage = FeedsPage()
        feedsPage.navigationTitleButton.waitIsVisible()
        feedsPage.navigationSettingsButton.tap()

        let settingsPage = SettingsPage()
        settingsPage.navigationTitle.waitIsVisible()
        settingsPage.navigationDoneButton.waitIsVisible()

        settingsPage.settingsTitle.waitIsVisible()
        settingsPage.hackersOnGitLabel.waitIsVisible()
        settingsPage.sendFeedbackLabel.waitIsVisible()
        settingsPage.whatsNewLabel.waitIsVisible()

        settingsPage.usernameLabel.waitIsVisible()

        settingsPage.showThumbnailsLabel.waitIsVisible()
        settingsPage.showThumbnailsSwitch.waitIsVisible()
        settingsPage.swipeActionsLabel.waitIsVisible()
        settingsPage.swipeActionsSwitch.waitIsVisible()
        settingsPage.openInDefaultBrowserLabel.waitIsVisible()
        settingsPage.openInDefaultBrowserSwitch.waitIsVisible()
        settingsPage.safariReaderModeLabel.waitIsVisible()
        settingsPage.safariReaderModeSwitch.waitIsVisible()

        settingsPage.versionLabel.waitIsVisible()
    }

    func testLoginUI() {
        launch(disableOnboarding: true)
        let feedsPage = FeedsPage()
        feedsPage.navigationTitleButton.waitIsVisible()
        feedsPage.navigationSettingsButton.tap()

        let settingsPage = SettingsPage()
        settingsPage.navigationTitle.waitIsVisible()

        settingsPage.usernameLabel.tap()

        settingsPage.loginTitle.waitIsVisible()
        settingsPage.trustTitle.waitIsVisible()
        settingsPage.usernameField.typeText("uiTests")
        settingsPage.passwordField.typeText("2Ew9z6bq")
        settingsPage.loginButton.tap()
        // TODO: Авторизация не работает
    }

    func testRegisterUI() {
        launch(disableOnboarding: true)
        let feedsPage = FeedsPage()
        feedsPage.navigationTitleButton.waitIsVisible()
        feedsPage.navigationSettingsButton.tap()

        let settingsPage = SettingsPage()
        settingsPage.navigationTitle.waitIsVisible()

        settingsPage.usernameLabel.tap()

        settingsPage.loginTitle.waitIsVisible()
        settingsPage.registerButton.tap()
        SafariPage().urlButton.waitIsVisible()
    }
}
