//
//  AddContactViewController.swift
//  Columbus Contact Book
//
//  Created by Mahia113
//

import UIKit

class AddContactViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    @IBOutlet weak var notesTesxtView: UITextView!
    
    @IBOutlet weak var helperLabel: UILabel!

    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customNotesTextView()
        
    }
    
    func customNotesTextView(){
        notesTesxtView.layer.borderColor = UIColor.systemGray6.cgColor;
        notesTesxtView.layer.borderWidth = 1.0;
        notesTesxtView.layer.cornerRadius = 5.0;
    }
    
    @IBAction func addEvent(_ sender: Any) {
        
    }
}
