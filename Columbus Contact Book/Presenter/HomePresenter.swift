//
//  HomePresenter.swift
//  Columbus Contact Book
//
//  Created by Mahia113
//

import UIKit

protocol HomeViewControllerDelegate: NSObjectProtocol {
    func displayWheaterData(description:(String))
}

class HomePresenter {
    
    weak private var homeViewControllerDelegate: HomeViewControllerDelegate?
    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    private let ccbManager: CCBManager = CCBManager()
    
    init() {}
    
    func setViewDelegate(homeViewControllerDelegate: HomeViewControllerDelegate?) {
        self.homeViewControllerDelegate = homeViewControllerDelegate
    }
    
    func goToAddContact(controller: UIViewController) {
        let addContactViewController = storyBoard.instantiateViewController(withIdentifier: "addContact")
        addContactViewController.modalPresentationStyle = .fullScreen
        controller.present(addContactViewController, animated: true, completion: nil)
    }
    
    func goToGetContacts(controller: UIViewController) {
        let contactListViewController = storyBoard.instantiateViewController(withIdentifier: "contactListView") as! ContactListViewController
        
        let listContacts = ccbManager.CCBDataPersistence().getContacts()
        
        contactListViewController.listContacts = listContacts

        controller.present(contactListViewController, animated: true, completion: nil)
    }
    
}
