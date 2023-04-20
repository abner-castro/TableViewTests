//
//  TableViewTestsTests.swift
//  TableViewTestsTests
//
//  Created by Abner Castro on 20/04/23.
//

import XCTest
@testable import TableViewTests

final class TableViewTestsTests: XCTestCase {
    
    var sut: ViewController!
    
    override func setUp() {
        super.setUp()
        sut = ViewController()
        sut.service = RemoteService()
        sut.loadViewIfNeeded()
    }
    
    func testViewControllerTitleIsNotNil() {
        XCTAssertNotNil(sut.title)
    }
    
    func testViewControllerBackgroundIsSystem() {
        XCTAssertEqual(sut.view.backgroundColor, .systemBackground)
    }
    
    func testViewControllerHasTableViewAddedAsSubview() {
        XCTAssertNotNil(sut.view.subviews.first as? UITableView)
    }
    
    func testTableViewHasDatasourceSetUpCorrect() {
        XCTAssertNotNil(sut.tableView.dataSource)
    }
    
    func testTableArrayInitiallyHasZeroElements() {
        XCTAssertEqual(sut.tableArray.count, 0)
    }
    
    func testTableViewInitallyHasZeroElements() {
        XCTAssertEqual(sut.tableView.dataSource?.tableView(sut.tableView, numberOfRowsInSection: 0), 0)
    }
    
    func testTableView_whenReloads_HasMoreThanZeroElements() {
        let expectation = expectation(description: "table view expectation")
        let result = XCTWaiter.wait(for: [expectation], timeout: 3.0)
        
        if result == XCTWaiter.Result.timedOut {
            XCTAssertTrue(sut.tableView.dataSource!.tableView(sut.tableView, numberOfRowsInSection: 0) > 0)
        } else {
            XCTFail("Error on testing")
        }
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
}
