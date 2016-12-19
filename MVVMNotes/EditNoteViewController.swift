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
    
    let titleTextField: UITextField = {
        let titleTextField = UITextField()
        titleTextField.placeholder = "Title"
        return titleTextField
    }()
    
    let contentLabel: UILabel = {
        let contentLabel = UILabel()
        contentLabel.text = "Content:"
        return contentLabel
    }()
    
    let contentTextView: UITextView = {
        let contentTextView = UITextView()
        return contentTextView
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
        
        view.addSubview(titleTextField)
        titleTextField.snp.makeConstraints { (make) in
            make.top.equalTo(topLayoutGuide.snp.bottom).offset(7)
            make.left.equalTo(7)
            make.right.equalTo(-7)
            make.height.equalTo(30)
        }
        
        view.addSubview(contentLabel)
        contentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleTextField.snp.bottom).offset(7)
            make.left.equalTo(7)
            make.right.equalTo(7)
            make.height.equalTo(25)
        }
        
        view.addSubview(contentTextView)
        contentTextView.snp.makeConstraints { (make) in
            make.top.equalTo(contentLabel.snp.bottom).offset(7)
            make.left.equalTo(7)
            make.right.equalTo(-7)
            make.bottom.equalTo(bottomLayoutGuide.snp.top).offset(7)
        }
    }
    
    func cancelPressed() {
        dismiss(animated: true, completion: nil)
    }
    
    func donePressed() {
        dismiss(animated: true, completion: nil)
    }
}
