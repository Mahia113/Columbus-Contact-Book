//
//  HomePresenter.swift
//  Columbus Contact Book
//
//  Created by Mahia113
//

import Foundation

protocol HomeViewControllerDelegate: NSObjectProtocol {
    func displayWheaterData(description:(String))
}

class HomePresenter {
    
    weak private var homeViewControllerDelegate: HomeViewControllerDelegate?
    
    init() {}
    
    func setViewDelegate(homeViewControllerDelegate: HomeViewControllerDelegate?) {
        self.homeViewControllerDelegate = homeViewControllerDelegate
    }
    
    func goToAddContact() {
        
    }
    
    func goToGetContacts() {
        
    }
    
}
