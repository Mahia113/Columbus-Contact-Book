//
//  EditContactViewController.swift
//  Columbus Contact Book
//
//  Created by Mahia113
//

import UIKit

class EditContactViewController: UIViewController, EditContactViewControllerDelegate {

    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var nameContact: UITextField!
    @IBOutlet weak var phoneContact: UITextField!
    @IBOutlet weak var emailContact: UITextField!
    @IBOutlet weak var addressContact: UITextField!
    @IBOutlet weak var noteContact: UITextView!
    
    var contact: ContactModel?
    private var oldEmail: String?
    
    let editContactPresenter: EditContactPresenter = EditContactPresenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        oldEmail = contact?.email
        customViewContainer()
        setValues()
        editContactPresenter.setViewDelegate(editContactViewControllerDelegate: self)
    }
    
    @IBAction func backEvent(_ sender: Any) {
        editContactPresenter.dismissController(controller: self)
    }
    
    @IBAction func updateEvent(_ sender: Any) {
        let name = nameContact.text
        let phone = phoneContact.text
        let email = emailContact.text
        let address = addressContact.text
        let notes = noteContact.text
        
        let contactUpdate = ContactModel(name: name!, phone: phone!, email: email!, address: address!, notes: notes!)
        
        editContactPresenter.updateContact(email: oldEmail!, contact: contactUpdate)
    }
    
    func contactUpdated(update: Bool) {
        editContactPresenter.goToHome(controller: self)
    }
    
    func setValues(){
        nameContact.text = contact?.name
        phoneContact.text = contact?.phone
        emailContact.text = contact?.email
        addressContact.text = contact?.address
        noteContact.text = contact?.notes
    }
    
    func customViewContainer(){
        viewContainer.layer.backgroundColor = UIColor.white.cgColor
        viewContainer.layer.cornerRadius = 20
        viewContainer.layer.shadowColor = UIColor.black.cgColor
        viewContainer.layer.shadowOffset = CGSize(width: 3, height: 3)
        viewContainer.layer.shadowOpacity = 0.7
        viewContainer.layer.shadowRadius = 4.0
    }
    
}
