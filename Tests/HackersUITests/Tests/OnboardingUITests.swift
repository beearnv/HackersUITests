//
//  OnboardingUITests.swift
//  HackersUITest
//
//  Created by Nikita Berezin on 21.05.2022.
//  Copyright © 2022 Glass Umbrella. All rights reserved.
//

import XCTest

class OnboardingUITests: BaseTestCase {

    // MARK: - Tests

    func testOnboarding() {
        launch(disableOnboarding: false)

        let onboardingPage = OnboardingPage()
        onboardingPage.whatsNewTitle.waitIsVisible()
        onboardingPage.completionButton.tap()

        let feedsPage = FeedsPage()
        feedsPage.navigationTitleButton.waitIsVisible()
    }
}
