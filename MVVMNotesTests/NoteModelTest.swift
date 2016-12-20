//
//  NoteModelTest.swift
//  MVVMNotes
//
//  Created by Evan Grossman on 12/19/16.
//  Copyright © 2016 Evan Grossman. All rights reserved.
//

import XCTest
import RealmSwift
@testable import MVVMNotes

class NoteModelTest: XCTestCase {
    
    let realm = try! Realm()
    
    override func setUp() {
        super.setUp()
        try! realm.write {
            realm.deleteAll()
        }
    }
    
    override func tearDown() {
        try! realm.write {
            realm.deleteAll()
        }
        
        super.tearDown()
    }
    
    func testRealmWriteReadDelete() {
        
        let notes = realm.objects(Note.self)
        XCTAssert(notes.count == 0)
        
        let note = Note()
        try! realm.write {
            realm.add(note)
        }
        XCTAssert(notes.count == 1)
        
        try! realm.write {
            realm.delete(note)
        }
        XCTAssert(notes.count == 0)
        
    }
    
}
