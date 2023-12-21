//
//  ChatViewModelTests.swift
//  ChatAppSwiftUI
//
//  Created by Safa on 21.12.2023.
//

import XCTest
@testable import ChatAppSwiftUI

final class ChatViewModelTests: XCTestCase {

    var viewModel : ChatViewModel?
    
    override func setUp()  {
        super.setUp()
        viewModel = ChatViewModel(service: MockWebService())
    }

    override func tearDown()  {
        super.tearDown()
        viewModel = nil
    }

    func testExample() throws {
        let expectation = XCTestExpectation(description: "data fetching")
         
         Task{
             await viewModel?.getMessages()
             expectation.fulfill()
         }
         
         wait(for: [expectation], timeout: 2)
         
         XCTAssertEqual(self.viewModel?.messages.count, 3)
    }

}
