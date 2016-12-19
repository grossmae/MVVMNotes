//
//  EditNoteViewController.swift
//  MVVMNotes
//
//  Created by Evan Grossman on 12/18/16.
//  Copyright © 2016 Evan Grossman. All rights reserved.
//

import UIKit
import SnapKit

class EditNoteViewController: UIViewController {
    
    var note: NoteViewModel!;
    
    let cancelBarButtonItem: UIBarButtonItem = {
        let cancelBarButtonItem = UIBarButtonItem()
        cancelBarButtonItem.title = "Cancel"
        return cancelBarButtonItem
    }()
    
    let doneBarButtonItem: UIBarButtonItem = {
        let doneBarButtonItem = UIBarButtonItem()
        doneBarButtonItem.title = "Done"
        return doneBarButtonItem
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if note == nil {
            note = NoteViewModel(note: Note(id: "", created: Date(), title: "", content: ""))
        }
        
        setUpSubviews()
        
        cancelBarButtonItem.target = self
        cancelBarButtonItem.action = #selector(cancelPressed)
        
        doneBarButtonItem.target = self
        doneBarButtonItem.action = #selector(donePressed)
    }
    
    func setUpSubviews() {
        
        navigationItem.leftBarButtonItem = cancelBarButtonItem
        navigationItem.rightBarButtonItem = doneBarButtonItem
    }
    
    func cancelPressed() {
        dismiss(animated: true, completion: nil)
    }
    
    func donePressed() {
        dismiss(animated: true, completion: nil)
    }
}
