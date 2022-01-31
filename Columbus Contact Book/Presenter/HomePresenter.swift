//
//  HomePresenter.swift
//  Columbus Contact Book
//
//  Created by Mahia113
//

import Foundation
import UIKit

protocol HomeViewControllerDelegate: NSObjectProtocol {
    func displayWheaterData(description:(String))
}

class HomePresenter {
    
    weak private var homeViewControllerDelegate: HomeViewControllerDelegate?
    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
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
        let addContactViewController = storyBoard.instantiateViewController(withIdentifier: "contactListView")
        //addContactViewController.modalPresentationStyle = .fullScreen
        controller.present(addContactViewController, animated: true, completion: nil)
    }
    
}
