//
//  ViewController.swift
//  Columbus Contact Book
//
//  Created by Mahia113
//

import UIKit

class HomeViewController: UIViewController, HomeViewControllerDelegate {
    
    private let homePresenter: HomePresenter = HomePresenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        homePresenter.setViewDelegate(homeViewControllerDelegate: self)
    }
    
    func displayWheaterData(description: (String)) {
        
    }
    
}

