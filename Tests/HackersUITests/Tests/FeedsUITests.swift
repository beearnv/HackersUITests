//
//  FeedsUITests.swift
//  HackersUITests
//
//  Created by Nikita Berezin on 22.05.2022.
//  Copyright © 2022 Glass Umbrella. All rights reserved.
//

import XCTest

class FeedsUITests: BaseTestCase {

    // MARK: - Tests

    func testNewsListingUI() {
        launch(disableOnboarding: true)

        let feedsPage = FeedsPage()
        feedsPage.navigationTitleButton.waitIsVisible()
        feedsPage.navigationSettingsButton.waitIsVisible()

        feedsPage.feedCell.waitIsVisible()
        feedsPage.feedCellImage.waitIsVisible()
        feedsPage.feedCellTitle.waitIsVisible()
        feedsPage.feedMetadataLabel.waitIsVisible()
    }

    func testNewsCommentsUI() {
        launch(disableOnboarding: true)

        stubFile(fileName: "item.html", url: "https://news.ycombinator.com/item")
        let feedsPage = FeedsPage()
        feedsPage.navigationTitleButton.waitIsVisible()
        feedsPage.navigationSettingsButton.waitIsVisible()

        feedsPage.feedCell.waitIsVisible()
        feedsPage.feedCell.tap()

        let commentsPage = CommentsPage()
        commentsPage.postCell.waitIsVisible()
        commentsPage.postTitleLable.waitIsVisible()
        commentsPage.metadataLabel.waitIsVisible()
        commentsPage.postImage.waitIsVisible()

        commentsPage.commentCell.waitIsVisible()
        commentsPage.authorLabel.waitIsVisible()
        commentsPage.commentText.waitIsVisible()
        commentsPage.datePostedLabel.waitIsVisible()

        commentsPage.navigationShareButton.tap()

        commentsPage.articleLinkButton.waitIsVisible()
        commentsPage.hackersLinkButton.waitIsVisible()
        commentsPage.cancelButton.tap()

        commentsPage.navigationBackButton.tap()

        feedsPage.navigationTitleButton.waitIsVisible()
    }

    func testAskListingUI() {
        launch(disableOnboarding: true)
        stubFile(fileName: "askP1.html", url: "https://news.ycombinator.com/ask")

        let feedsPage = FeedsPage()
        feedsPage.navigationTitleButton.waitIsVisible()
        feedsPage.navigationTitleButton.tap()
        feedsPage.menuAskButton.tap()

        feedsPage.feedCell.waitIsVisible()
        feedsPage.feedCellImage.waitIsVisible()
        feedsPage.feedCellTitle.waitIsVisible()
        XCTAssertEqual(feedsPage.feedCellTitle.label, "Моканный заголовок в новости ask")
        feedsPage.feedMetadataLabel.waitIsVisible()
    }

    func testShowListingUI() {
        launch(disableOnboarding: true)
        stubFile(fileName: "showP1.html", url: "https://news.ycombinator.com/show")

        let feedsPage = FeedsPage()
        feedsPage.navigationTitleButton.waitIsVisible()
        feedsPage.navigationTitleButton.tap()
        feedsPage.menuShowButton.tap()

        feedsPage.feedCell.waitIsVisible()
        feedsPage.feedCellImage.waitIsVisible()
        feedsPage.feedCellTitle.waitIsVisible()
        XCTAssertEqual(feedsPage.feedCellTitle.label, "Моканный заголовок новости show")
        feedsPage.feedMetadataLabel.waitIsVisible()
    }

    func testJobsListingUI() {
        launch(disableOnboarding: true)
        stubFile(fileName: "jobs.html", url: "https://news.ycombinator.com/jobs")

        let feedsPage = FeedsPage()
        feedsPage.navigationTitleButton.waitIsVisible()
        feedsPage.navigationTitleButton.tap()
        feedsPage.menuJobsButton.tap()

        feedsPage.feedCell.waitIsVisible()
        feedsPage.feedCellImage.waitIsVisible()
        feedsPage.feedCellTitle.waitIsVisible()
        XCTAssertEqual(feedsPage.feedCellTitle.label, "Заголовок новости jobs")
        feedsPage.feedMetadataLabel.waitIsVisible()
    }

    func testJobsCommentsUI() {
        launch(disableOnboarding: true)
        stubFile(fileName: "jobs.html", url: "https://news.ycombinator.com/jobs")

        let feedsPage = FeedsPage()
        feedsPage.navigationTitleButton.waitIsVisible()
        feedsPage.navigationTitleButton.tap()
        feedsPage.menuJobsButton.tap()

        feedsPage.feedCell.waitIsVisible()
        feedsPage.feedCell.tap()

        let safariPage = SafariPage()
        safariPage.imbeddedBrowserUrl.waitIsVisible()
        safariPage.imbeddedBrowserBackButton.tap()

        feedsPage.navigationTitleButton.waitIsVisible()
    }

    func testNewestListingUI() {
        launch(disableOnboarding: true)
        stubFile(fileName: "newest.html", url: "https://news.ycombinator.com/newest")

        let feedsPage = FeedsPage()
        feedsPage.navigationTitleButton.waitIsVisible()
        feedsPage.navigationTitleButton.tap()
        feedsPage.menuNewButton.tap()

        feedsPage.feedCell.waitIsVisible()
        feedsPage.feedCellImage.waitIsVisible()
        feedsPage.feedCellTitle.waitIsVisible()
        XCTAssertEqual(feedsPage.feedCellTitle.label, "Заголовок первой новости в новейшем")
        feedsPage.feedMetadataLabel.waitIsVisible()
    }

    func testBestListingUI() {
        launch(disableOnboarding: true)
        stubFile(fileName: "bestP1.html", url: "https://news.ycombinator.com/best")

        let feedsPage = FeedsPage()
        feedsPage.navigationTitleButton.waitIsVisible()
        feedsPage.navigationTitleButton.tap()
        feedsPage.menuBestButton.tap()

        feedsPage.feedCell.waitIsVisible()
        feedsPage.feedCellImage.waitIsVisible()
        feedsPage.feedCellTitle.waitIsVisible()
        XCTAssertEqual(feedsPage.feedCellTitle.label, "Заголовок первой новости в лучшем")
        feedsPage.feedMetadataLabel.waitIsVisible()
    }

    func testDarkListingUI() {
        launch(darkTheme: true, disableOnboarding: true)

        let feedsPage = FeedsPage()
        feedsPage.navigationTitleButton.waitIsVisible()
        feedsPage.navigationSettingsButton.waitIsVisible()

        feedsPage.feedCell.waitIsVisible()
        feedsPage.feedCellImage.waitIsVisible()
        feedsPage.feedCellTitle.waitIsVisible()
        feedsPage.feedMetadataLabel.waitIsVisible()
    }

}
