//
//  BasePageObjects.swift
//  HackersUITests
//
//  Created by Nikita Berezin on 21.05.2022.
//  Copyright © 2022 Glass Umbrella. All rights reserved.
//

import XCTest

class BasePageObjects {

    // MARK: - Internal properties
    // MARK: - XCUIElements

    var app: XCUIApplication

    lazy var navigationBackButton = app.navigationBars.buttons.element(boundBy: 0)

    // MARK: - Init

    required init(application: XCUIApplication = XCUIApplication()) {
         app = application
     }

}
