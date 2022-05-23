//
//  SafariPage.swift
//  HackersUITests
//
//  Created by Nikita Berezin on 22.05.2022.
//  Copyright © 2022 Glass Umbrella. All rights reserved.
//

import XCTest

class SafariPage {

    // MARK: - Internal properties
    // MARK: - XCUIElements

    var app: XCUIApplication
    var safariApp: XCUIApplication

    lazy var imbeddedBrowserBackButton = app.otherElements["TopBrowserBar"].buttons.element(boundBy: 0)
    lazy var imbeddedBrowserUrl = app.buttons["URL"]

    lazy var webView = safariApp.webViews["WebView"].firstMatch

    // MARK: - Init

    required init(safariApp: XCUIApplication = XCUIApplication(bundleIdentifier: "com.apple.mobilesafari"),
                  app: XCUIApplication = XCUIApplication()) {
        self.safariApp = safariApp
        self.app = app
    }

}
