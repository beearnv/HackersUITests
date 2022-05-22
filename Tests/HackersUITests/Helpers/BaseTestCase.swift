//
//  BaseTestCase.swift
//  HackersUITest
//
//  Created by Nikita Berezin on 21.05.2022.
//  Copyright © 2022 Glass Umbrella. All rights reserved.
//

import XCTest
import SBTUITestTunnelClient

class BaseTestCase: XCTestCase {

    // MARK: - Internal Methods

    func launch(darkTheme: Bool = false, disableOnboarding: Bool = true) {
        // disableOnboarding
        if disableOnboarding {
            app.launchArguments.append("disableOnboarding")
        }

        // set theme
        if darkTheme {
            app.launchArguments.append("darkMode")
        }
        app.launchTunnel(withOptions: [SBTUITunneledApplicationLaunchOptionResetFilesystem]) {
            self.app.stubRequests(matching: SBTRequestMatch(url: "https://news.ycombinator.com/news"),
                                  response: SBTStubResponse(fileNamed: "newsP1.html"))
        }
    }

    func stubFile(fileName: String, url: String) {
        let responseFile = SBTStubResponse(fileNamed: fileName)
        app.stubRequests(matching: SBTRequestMatch(url: url),
                         response: responseFile)
    }

}
