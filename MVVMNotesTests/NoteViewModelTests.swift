//
//  NoteViewModelTests.swift
//  MVVMNotes
//
//  Created by Evan Grossman on 12/17/16.
//  Copyright © 2016 Evan Grossman. All rights reserved.
//

import XCTest
@testable import MVVMNotes

class NoteViewModelTest: XCTestCase {
    
    var noteVM: NoteViewModel!
    
    let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyy-MM-dd"
        return dateFormatter
    }()
    
    
    override func setUp() {
        super.setUp()
        let date = dateFormatter.date(from: "1999-09-01")!
        let note = Note(id: "1", created:date , title: "Test Note", content: "This is a test note")
        noteVM = NoteViewModel(note: note)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        noteVM = nil
        super.tearDown()
    }
    
    func testNoteViewModel() {
        
        XCTAssertEqual(noteVM.titleText, "Test Note")
        XCTAssertEqual(noteVM.contentText, "This is a test note")
        XCTAssertEqual(noteVM.createdText, "September 1, 1999")
    }
    
}
