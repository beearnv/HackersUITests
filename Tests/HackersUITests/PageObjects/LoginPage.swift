//
//  LoginPage.swift
//  HackersUITests
//
//  Created by Nikita Berezin on 21.05.2022.
//  Copyright © 2022 Glass Umbrella. All rights reserved.
//

import XCTest

class LoginPage: BasePageObjects {

    // MARK: - XCUIElements

    lazy var doneButton = app.navigationBars.buttons["doneButton"]

    lazy var loginTitle = app.staticTexts["loginTitle"]
    lazy var usernameField = app.textFields["usernameField"]
    lazy var passwordField = app.textFields["passwordField"]
    lazy var trustTitle = app.staticTexts["trustTitle"]
    lazy var loginButton = app.buttons["loginButton"]
    lazy var registerButton = app.buttons["registerButton"]

}
