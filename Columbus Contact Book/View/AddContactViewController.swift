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
    @IBOutlet weak var backButton: UIButton!
    
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
        
        if validatorTextFiled() {
            print("campos obligatorios llenos")
        } else{
            print("campos obligatorios no llenos")
        }
        
    }
    
    
    @IBAction func backEvent(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func validatorTextFiled() -> Bool {
        
        helperLabel.text = ""
        
        let name = nameTextField.text!
        let email = emailTextField.text!
        let phone = phoneTextField.text!
        
        if name.isEmpty {
            helperLabel.text = "El campo nombre es obligatorio"
            return false
        } else if phone.isEmpty {
            helperLabel.text = "El campo télefono es obligatorio"
            return false
        } else if email.isEmpty {
            helperLabel.text = "El campo email es obligatorio"
            return false
        }
        
        return true
    }
}
