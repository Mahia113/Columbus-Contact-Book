//
//  ContactListPresenter.swift
//  Columbus Contact Book
//
//  Created by Mahia113
//

import UIKit

protocol ContactListViewControllerDelegate: NSObjectProtocol {
    
}

class ContactListPresenter {
    
    weak private var contactListViewControllerDelegate: ContactListViewControllerDelegate?
    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)

    init() {}
    
    func setViewDelegate(contactListViewControllerDelegate: ContactListViewControllerDelegate?){
        self.contactListViewControllerDelegate = contactListViewControllerDelegate
    }
    
    func goToContactDetails(contact: ContactModel){
        print("Contact selected: \(contact)")
        
    }
    
    func dissmisController(controller: UIViewController){
        controller.dismiss(animated: true, completion: nil)
    }
    
}
