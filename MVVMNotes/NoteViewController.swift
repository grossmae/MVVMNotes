//
//  NoteViewController.swift
//  MVVMNotes
//
//  Created by Evan Grossman on 12/17/16.
//  Copyright © 2016 Evan Grossman. All rights reserved.
//

import Foundation
import SnapKit


import UIKit

class NoteViewController: UIViewController {
    
    var noteViewModel: NoteViewModel!;
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: 27)
        return titleLabel
    }()
    
    let contentTextView: UITextView = {
        return UITextView()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpSubviews()
        
        titleLabel.text = noteViewModel.titleText
        contentTextView.text = noteViewModel.contentText
    }
    
    func setUpSubviews() {
        
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(topLayoutGuide.snp.bottom).offset(3)
            make.left.equalTo(15)
            make.right.equalTo(-3)
            make.height.equalTo(30)
        }
        
        view.addSubview(contentTextView)
        contentTextView.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.left.equalTo(3)
            make.right.bottom.equalTo(-3)
        }
    }
    
}

