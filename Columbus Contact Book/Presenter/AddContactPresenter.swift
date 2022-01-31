//
//  AddContactPresenter.swift
//  Columbus Contact Book
//
//  Created by Mahia113
//

import Foundation
import UIKit

protocol AddContactViewDelegate: NSObjectProtocol {
    func contactSaved(saved: Bool)
}

class AddContactPresenter {
    
    weak private var addContactViewDelegate: AddContactViewDelegate?
    private let ccbManager: CCBManager = CCBManager()
    
    init() {}
    
    func setViewDelegate(addContactViewDelegate: AddContactViewDelegate?) {
        self.addContactViewDelegate = addContactViewDelegate
    }
    
    func saveContact(name: String, email: String, phone: String, address: String, notes: String){        
        let dataConctact: Dictionary<String, String> = [
            "name": name,
            "phone": phone,
            "email": email,
            "address": address,
            "notes": notes
        ]
        
        let saved = ccbManager.CCBDataPersistence().addContact(data: dataConctact)
        
        addContactViewDelegate?.contactSaved(saved: saved)
    }
    
    func dissmisController(controller: UIViewController){
        controller.dismiss(animated: true, completion: nil)
    }
    
}
