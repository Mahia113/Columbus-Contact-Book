//
//  AddContactPresenter.swift
//  Columbus Contact Book
//
//  Created by Anzen on 30/01/22.
//

import Foundation
import UIKit

protocol AddContactViewDelegate: NSObjectProtocol {
    func contactSaved(saved: Bool)
}

class AddContactPresenter {
    
    weak private var addContactViewDelegate: AddContactViewDelegate?
    
    init() {}
    
    func setViewDelegate(addContactViewDelegate: AddContactViewDelegate?) {
        self.addContactViewDelegate = addContactViewDelegate
    }
    
    func saveContact(name: String, email: String, phone: String, address: String, notes: String){
        print("presenter contact save")
    }
    
    func dissmisController(controller: UIViewController){
        controller.dismiss(animated: true, completion: nil)
    }
    
}
