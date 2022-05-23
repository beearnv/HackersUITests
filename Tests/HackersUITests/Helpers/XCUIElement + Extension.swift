//
//  XCUIElement + Extension.swift
//  HackersUITests
//
//  Created by Nikita Berezin on 21.05.2022.
//  Copyright © 2022 Glass Umbrella. All rights reserved.
//

import XCTest

extension XCUIElement {

    // MARK: - Internal Methods

    func waitIsVisible(timeout: TimeInterval = 15) {
        let predicate = NSPredicate(format: "isHittable == true")
        let expectation = XCTNSPredicateExpectation(predicate: predicate, object: self)
        let result = XCTWaiter().wait(for: [expectation], timeout: timeout)

        if result != .completed {
            print("App: \(XCUIApplication().debugDescription)")
        }

        XCTAssertTrue(result == .completed, "<\(self)> not visible after <\(timeout)> seconds."
                      + " Result: <\(result)>")
    }
}

extension XCUIElementQuery {

    // MARK: - Internal Properties

    var lastMatch: XCUIElement { return self.element(boundBy: self.count - 1) }

}
