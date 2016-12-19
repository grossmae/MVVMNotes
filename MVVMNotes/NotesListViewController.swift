//
//  NotesListViewController.swift
//  MVVMNotes
//
//  Created by Evan Grossman on 12/17/16.
//  Copyright © 2016 Evan Grossman. All rights reserved.
//

import UIKit

class NotesListViewController: UIViewController {

    var noteVMs = [NoteViewModel]()
    
    let notesTableView: UITableView = {
        return UITableView()
    }()
    
    let noteCellIdentifier = "note_cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpSubviews()
        
        notesTableView.delegate = self
        notesTableView.dataSource = self
        notesTableView.register(NoteTableViewCell.self, forCellReuseIdentifier: noteCellIdentifier)
        
        fetchNotes()
    }
    
    func setUpSubviews() {
        
        view.addSubview(notesTableView)
        notesTableView.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalTo(0)
        }
    }
    
    func fetchNotes() {
        
    }

}

extension NotesListViewController: UITableViewDelegate {
    
}

extension NotesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteVMs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let noteCell = tableView.dequeueReusableCell(withIdentifier: noteCellIdentifier) as! NoteTableViewCell
        noteCell.noteVM = noteVMs[indexPath.row]
        return noteCell
    }
}
