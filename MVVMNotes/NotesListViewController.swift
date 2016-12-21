//
//  NotesListViewController.swift
//  MVVMNotes
//
//  Created by Evan Grossman on 12/17/16.
//  Copyright © 2016 Evan Grossman. All rights reserved.
//

import UIKit
import RealmSwift

class NotesListViewController: UIViewController {
    
    let realm = try! Realm()
    var notes: Results<Note> {
        get {
            return realm.objects(Note.self)
        }
    }

    var noteVMs = [NoteViewModel]()
    
    let addNoteBarButton: UIBarButtonItem = {
        let addNoteBarButton = UIBarButtonItem()
        addNoteBarButton.title = "＋"
        return addNoteBarButton
    }()
    
    let notesTableView: UITableView = {
        return UITableView()
    }()
    
    let noteCellIdentifier = "note_cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpSubviews()
        
        addNoteBarButton.target = self
        addNoteBarButton.action = #selector(addNotePressed)
        
        notesTableView.delegate = self
        notesTableView.dataSource = self
        notesTableView.register(NoteTableViewCell.self, forCellReuseIdentifier: noteCellIdentifier)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        fetchNotes()
    }
    
    func setUpSubviews() {
        
        navigationItem.setRightBarButton(addNoteBarButton, animated: false)
        
        view.addSubview(notesTableView)
        notesTableView.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalTo(0)
        }
    }
    
    func fetchNotes() {
        
        noteVMs.removeAll()
        
        for note in notes {
            let noteVM = NoteViewModel(note: note)
            noteVMs.append(noteVM)
        }
        
        notesTableView.reloadData()
    }
    
    func addNotePressed() {
        let editNoteVC = EditNoteViewController()
        present(UINavigationController(rootViewController: editNoteVC), animated: true, completion: nil)
        
    }

}

extension NotesListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let note = notes[indexPath.row]
            try! realm.write {
                realm.delete(note)
            }
            fetchNotes()
            tableView.reloadData()            
        }
    }
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
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}
