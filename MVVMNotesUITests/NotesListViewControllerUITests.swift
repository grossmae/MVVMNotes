//
//  NotesListViewControllerUITests.swift
//  MVVMNotes
//
//  Created by Evan Grossman on 12/17/16.
//  Copyright © 2016 Evan Grossman. All rights reserved.
//

import XCTest

class NotesListViewControllerUITests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        XCUIApplication().launch()
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAddNoteButton() {
                
        XCUIApplication().navigationBars["MVVMNotes.NotesListView"].buttons["＋"].tap()
    }
    
    func testNotesTable() {
        
        let app = XCUIApplication()
        let table = app.tables.element(boundBy: 0)
        XCTAssert(table.cells.count == 0)
    }
}
