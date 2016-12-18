//
//  NoteTableViewCell.swift
//  MVVMNotes
//
//  Created by Evan Grossman on 12/17/16.
//  Copyright © 2016 Evan Grossman. All rights reserved.
//

import UIKit

class NoteTableViewCell: UITableViewCell {
    
    var noteVM: NoteViewModel! {
        didSet {
            self.textLabel?.text = noteVM.titleText
            self.detailTextLabel?.text = noteVM.createdText
        }
    }
}
