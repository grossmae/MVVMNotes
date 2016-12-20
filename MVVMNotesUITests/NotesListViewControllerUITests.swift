//
//  NotesListViewControllerUITests.swift
//  MVVMNotes
//
//  Created by Evan Grossman on 12/17/16.
//  Copyright © 2016 Evan Grossman. All rights reserved.
//

import XCTest
import RealmSwift

class NotesListViewControllerUITests: XCTestCase {
    
    let realm = try! Realm()
    
    override func setUp() {
        super.setUp()
        
        try! realm.write {
            realm.deleteAll()
        }
        
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        
        try! realm.write {
            realm.deleteAll()
        }
        
        super.tearDown()
    }
    
    func testAddNoteButton() {
        
        let app = XCUIApplication()
        let addNoteButton = app.navigationBars["MVVMNotes.NotesListView"].buttons["＋"]
        addNoteButton.tap()
        
        let mvvmnotesEditnoteviewNavigationBar = app.navigationBars["MVVMNotes.EditNoteView"]
        mvvmnotesEditnoteviewNavigationBar.buttons["Cancel"].tap()
        
        addNoteButton.tap()
        mvvmnotesEditnoteviewNavigationBar.buttons["Done"].tap()
        
        
  
    }
    
    func testNotesTable() {
        
        let notesTable = XCUIApplication().tables["Empty list"]
        XCTAssert(notesTable.cells.count == 0)
    }
}
