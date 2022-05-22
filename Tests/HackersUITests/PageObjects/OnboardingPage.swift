//
//  OnboardingPage.swift
//  HackersUITests
//
//  Created by Nikita Berezin on 21.05.2022.
//  Copyright © 2022 Glass Umbrella. All rights reserved.
//

import XCTest

class OnboardingPage: BasePageObjects {

    // MARK: - XCUIElements

    lazy var whatsNewTitle = app.staticTexts["whatsNewTitle"]
    lazy var completionButton = app.buttons["completionButton"]

}
