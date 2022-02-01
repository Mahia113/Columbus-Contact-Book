//
//  ContactDetailPresenter.swift
//  Columbus Contact Book
//
//  Created by Anzen on 31/01/22.
//

import UIKit

protocol ContactDetailViewControllerDelegate: NSObjectProtocol {
    func contactEliminated(eliminated: Bool)
}

class ContactDetailPresenter {
    
    weak private var contactDetailViewControllerDelegate: ContactDetailViewController?
    private let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    private let ccbManager: CCBManager = CCBManager()

    init() {}
    
    func setViewDelegate(contactDetailViewControllerDelegate: ContactDetailViewController?){
        self.contactDetailViewControllerDelegate = contactDetailViewControllerDelegate
    }
    
    func dismissController(controller: UIViewController){
        controller.dismiss(animated: true, completion: nil)
    }
    
    func goToEditContact(controller: UIViewController, contact: ContactModel){
        
        let editContactViewController = storyBoard.instantiateViewController(withIdentifier: "editContact") as! EditContactViewController
        editContactViewController.contact = contact
        controller.present(editContactViewController, animated: true, completion: nil)
    }
    
    func deleteContact(contact: ContactModel){
        let eliminated = ccbManager.CCBDataPersistence().deleteContact(email: contact.email)
        contactDetailViewControllerDelegate?.contactEliminated(eliminated: eliminated)
    }
    
    func callNumber(number: String){
        
    }
    
}
