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
    @IBOutlet weak var vieContainer: UIView!
    
    private let addContactPresenter: AddContactPresenter = AddContactPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customNotesTextView()
        customViewContainer()
        addContactPresenter.setViewDelegate(addContactViewDelegate: self)
    }
    
    @IBAction func addEvent(_ sender: Any) {
        
        let name = nameTextField.text
        let email = emailTextField.text
        let phone = phoneTextField.text
        let address = addressTextField.text
        let notes = notesTesxtView.text
        
        if validatorTextFiled() {
            addContactPresenter.saveContact(name: name!, email: email!, phone: phone!, address: address!, notes: notes!)
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
    
    func customViewContainer(){
        vieContainer.layer.backgroundColor = UIColor.white.cgColor
        vieContainer.layer.cornerRadius = 20
        vieContainer.layer.shadowColor = UIColor.black.cgColor
        vieContainer.layer.shadowOffset = CGSize(width: 3, height: 3)
        vieContainer.layer.shadowOpacity = 0.7
        vieContainer.layer.shadowRadius = 4.0
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
