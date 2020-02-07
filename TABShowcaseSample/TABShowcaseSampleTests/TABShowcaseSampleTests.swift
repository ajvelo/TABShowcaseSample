//
//  TABShowcaseSampleTests.swift
//  TABShowcaseSampleTests
//
//  Created by Andreas Velounias on 06/02/2020.
//  Copyright © 2020 Andreas Velounias. All rights reserved.
//

import XCTest
@testable import TABShowcaseSample

class TABShowcaseSampleTests: XCTestCase {
    
    var viewModel: CaseStudiesViewModel!
    fileprivate var service: Networking!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        self.service = Networking()
        self.viewModel = CaseStudiesViewModel()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        self.viewModel = nil
        self.service = nil
        super.tearDown()
    }

    func testFetchWithService() {
        viewModel.getCaseStudies {
            if self.viewModel.count == 0 {
                XCTAssert(false, "ViewModels successfully fetched")
            } else {
                XCTAssert(true, "ViewModels failed to be fetched")
            }
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
