//
//  TestObserver.swift
//  HackersUITests
//
//  Created by Nikita Berezin on 22.05.2022.
//  Copyright © 2022 Glass Umbrella. All rights reserved.
//

import XCTest

class TestObserver: NSObject, XCTestObservation {

    // MARK: - Init

    override init() {
        super.init()
        XCTestObservationCenter.shared.addTestObserver(self)
    }

    // MARK: - Internal Methods

    func testBundleWillStart(_ testBundle: Bundle) {
        let image = UIImage(named: "testImage",
                            in: Bundle(for: type(of: self)),
                            compatibleWith: nil)
        UIImageWriteToSavedPhotosAlbum(image!, self, nil, nil)
        UIImageWriteToSavedPhotosAlbum(image!, self, nil, nil)
        UIImageWriteToSavedPhotosAlbum(image!, self, nil, nil)
        closeAlertIfExists()
    }

    private func closeAlertIfExists() {
        let springboardAlertOkButton = XCUIApplication(bundleIdentifier: "com.apple.springboard")
            .alerts.buttons.firstMatch

        if springboardAlertOkButton.waitForExistence(timeout: 0.5) {
            springboardAlertOkButton.tap()
        }
    }
}
