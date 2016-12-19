//
//  Note.swift
//  MVVMNotes
//
//  Created by Evan Grossman on 12/17/16.
//  Copyright © 2016 Evan Grossman. All rights reserved.
//

import RealmSwift

class Note: Object {
    dynamic var id: String = NSUUID().uuidString
    dynamic var created: Date = Date()
    dynamic var title: String = ""
    dynamic var content: String = ""
}
