//
//  FeedsPage.swift
//  HackersUITests
//
//  Created by Nikita Berezin on 21.05.2022.
//  Copyright © 2022 Glass Umbrella. All rights reserved.
//

import XCTest

class FeedsPage: BasePageObjects {

    // MARK: - XCUIElements

    lazy var navigationTitleButton = app.navigationBars.buttons["titleButton"]
    lazy var navigationSettingsButton = app.navigationBars.buttons.lastMatch

    lazy var feedCell = app.cells["feedCell"].firstMatch
    lazy var feedCellImage = app.images["feedCellImage"].firstMatch
    lazy var feedCellTitle = app.staticTexts["feedCellTitle"].firstMatch
    lazy var feedMetadataLabel = app.staticTexts["feedMetadataLabel"].firstMatch

    lazy var menuTopButton = app.cells.buttons["TopButton"]
    lazy var menuAskButton = app.cells.buttons["AskButton"]
    lazy var menuShowButton = app.cells.buttons["ShowButton"]
    lazy var menuJobsButton = app.cells.buttons["JobsButton"]
    lazy var menuNewButton = app.cells.buttons["NewButton"]
    lazy var menuBestButton = app.cells.buttons["BestButton"]

}
