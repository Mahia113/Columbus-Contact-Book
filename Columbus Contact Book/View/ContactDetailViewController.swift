//
//  ContactDetailViewController.swift
//  Columbus Contact Book
//
//  Created by Mahia113
//

import UIKit

class ContactDetailViewController: UIViewController, ContactDetailViewControllerDelegate {
    
    @IBOutlet weak var viewContainerTop: UIView!
    @IBOutlet weak var viewContainerBottom: UIView!
    
    @IBOutlet weak var nameContactHeader: UILabel!
    @IBOutlet weak var phoneContactHeader: UILabel!
    
    @IBOutlet weak var nameContact: UILabel!
    @IBOutlet weak var phoneContact: UILabel!
    @IBOutlet weak var emailContact: UILabel!
    @IBOutlet weak var addressContact: UILabel!
    @IBOutlet weak var notesContact: UILabel!
    
    var contact: ContactModel?
    
    private let contactDetailPresenter: ContactDetailPresenter = ContactDetailPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customContainerTop()
        customContainerBottom()
        setValues()
        contactDetailPresenter.setViewDelegate(contactDetailViewControllerDelegate: self)
    }
    
    @IBAction func backEvent(_ sender: Any) {
        contactDetailPresenter.dismissController(controller: self)
    }
    
    @IBAction func callEvent(_ sender: Any) {
        
    }
    
    @IBAction func editEvent(_ sender: Any) {
        contactDetailPresenter.goToEditContact(controller: self, contact: contact!)
    }
    
    @IBAction func deleteEvent(_ sender: Any) {
        
    }
    
    func contactEliminated(eliminated: Bool) {
        //self.dismiss(animated: true, completion: nil)
    }
    
    func setValues(){
        nameContactHeader.text = contact?.name
        phoneContactHeader.text = contact?.phone
        nameContact.text = contact?.name
        phoneContact.text = contact?.phone
        emailContact.text = contact?.email
        addressContact.text = contact?.address
        notesContact.text = contact?.notes
    }
    
    func customContainerTop(){
        viewContainerTop.layer.backgroundColor = UIColor.white.cgColor
        viewContainerTop.layer.cornerRadius = 20
        viewContainerTop.layer.shadowColor = UIColor.black.cgColor
        viewContainerTop.layer.shadowOffset = CGSize(width: 3, height: 3)
        viewContainerTop.layer.shadowOpacity = 0.7
        viewContainerTop.layer.shadowRadius = 4.0
    }
    
    func customContainerBottom(){
        viewContainerBottom.layer.backgroundColor = UIColor.white.cgColor
        viewContainerBottom.layer.cornerRadius = 20
        viewContainerBottom.layer.shadowColor = UIColor.black.cgColor
        viewContainerBottom.layer.shadowOffset = CGSize(width: 3, height: 3)
        viewContainerBottom.layer.shadowOpacity = 0.7
        viewContainerBottom.layer.shadowRadius = 4.0
    }
    
}
