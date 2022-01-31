//
//  AddContactViewController.swift
//  Columbus Contact Book
//
//  Created by Mahia113
//

import UIKit

class AddContactViewController: UIViewController, AddContactViewDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var notesTesxtView: UITextView!
    @IBOutlet weak var helperLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    private let addContactPresenter: AddContactPresenter = AddContactPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customNotesTextView()
        addContactPresenter.setViewDelegate(addContactViewDelegate: self)
    }
    
    @IBAction func addEvent(_ sender: Any) {
        
        if validatorTextFiled() {
            addContactPresenter.saveContact(name: "", email: "", phone: "", address: "", notes: "")
        }

    }
    
    @IBAction func backEvent(_ sender: Any) {
        addContactPresenter.dissmisController(controller: self)
    }
    
    func contactSaved(saved: Bool) {
        addContactPresenter.dissmisController(controller: self)
    }
    
    func customNotesTextView(){
        notesTesxtView.layer.borderColor = UIColor.systemGray6.cgColor;
        notesTesxtView.layer.borderWidth = 1.0;
        notesTesxtView.layer.cornerRadius = 5.0;
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
