//
//  NoteViewModel.swift
//  MVVMNotes
//
//  Created by Evan Grossman on 12/17/16.
//  Copyright © 2016 Evan Grossman. All rights reserved.
//

import Foundation

struct NoteViewModel {
    
    let note: Note;
    
    let dateFormatter: DateFormatter = {
       let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        return dateFormatter
    }()
    
    var titleText: String {
        return note.title
    }
    
    var contentText: String {
        return note.content
    }
    
    var createdText: String {
        return dateFormatter.string(from: note.created)
    }
    
    
}
