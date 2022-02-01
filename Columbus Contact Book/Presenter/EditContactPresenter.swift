//
//  EditContactPresenter.swift
//  Columbus Contact Book
//
//  Created by Mahia113
//

import UIKit

protocol EditContactViewControllerDelegate: NSObjectProtocol {
    func contactUpdated(update: Bool)
}

class EditContactPresenter {
    
    weak private var editContactViewControllerDelegate: EditContactViewControllerDelegate?
    private let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    private let ccbManager: CCBManager = CCBManager()
    
    init() {}
    
    func setViewDelegate(editContactViewControllerDelegate: EditContactViewControllerDelegate?){
        self.editContactViewControllerDelegate = editContactViewControllerDelegate
    }
    
    func dismissController(controller: UIViewController){
        controller.dismiss(animated: true, completion: nil)
    }
    
    func updateContact(email: String, contact: ContactModel){
        let update = ccbManager.CCBDataPersistence().updateContact(email: email, data: contact)
        editContactViewControllerDelegate?.contactUpdated(update: update)
    }
    
    func goToHome(controller: UIViewController){
        
        let tempController = controller.presentingViewController
        let homeViewController = self.storyBoard.instantiateViewController(withIdentifier: "home") as! HomeViewController

        controller.dismiss(animated: true, completion: {
            tempController?.present(homeViewController, animated: true, completion: nil)
        })
    }
    
}
