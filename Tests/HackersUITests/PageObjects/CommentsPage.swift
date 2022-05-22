//
//  CommentsPage.swift
//  HackersUITests
//
//  Created by Nikita Berezin on 21.05.2022.
//  Copyright © 2022 Glass Umbrella. All rights reserved.
//

import XCTest

class CommentsPage: BasePageObjects {

    // MARK: - XCUIElements

    lazy var navigationShareButton = app.navigationBars.buttons.lastMatch

    lazy var postCell = app.cells["PostCell"]
    lazy var postTitleLable = app.staticTexts["postTitleLable"]
    lazy var metadataLabel = app.staticTexts["metadataLabel"]
    lazy var postImage = app.images["thumbnailImage"]

    lazy var commentCell = app.cells["OpenCommentCell"].firstMatch
    lazy var authorLabel = app.staticTexts["authorLabel"].firstMatch
    lazy var commentText = app.textViews["commentText"].firstMatch
    lazy var datePostedLabel = app.staticTexts["datePostedLabel"].firstMatch

    lazy var articleLinkButton = app.buttons["articleLinkButton"]
    lazy var hackersLinkButton = app.buttons["hackersLinkButton"]
    lazy var cancelButton = app.buttons["cancelButton"]

}
