//
//  ViewController.swift
//  Columbus Contact Book
//
//  Created by Mahia113
//

import UIKit

class HomeViewController: UIViewController, HomeViewControllerDelegate {
    
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var viewWeather: UIView!
        
    private let homePresenter: HomePresenter = HomePresenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        homePresenter.setViewDelegate(homeViewControllerDelegate: self)
        customViewContainer()
        customViewWeather()
    }
    
    @IBAction func addContactEvent(_ sender: Any) {
        homePresenter.goToAddContact(controller: self)
    }
    
    @IBAction func showListContactEvent(_ sender: Any) {
        print("showListContactEvent")
        homePresenter.goToGetContacts(controller: self)
    }
    
    func customViewContainer(){
        viewContainer.layer.backgroundColor = UIColor.white.cgColor
        viewContainer.layer.cornerRadius = 20
        viewContainer.layer.shadowColor = UIColor.black.cgColor
        viewContainer.layer.shadowOffset = CGSize(width: 3, height: 3)
        viewContainer.layer.shadowOpacity = 0.7
        viewContainer.layer.shadowRadius = 4.0
    }
    
    func customViewWeather(){
        viewWeather.layer.backgroundColor = UIColor.white.cgColor
        viewWeather.layer.cornerRadius = 20
        viewWeather.layer.shadowColor = UIColor.black.cgColor
        viewWeather.layer.shadowOffset = CGSize(width: 3, height: 3)
        viewWeather.layer.shadowOpacity = 0.7
        viewWeather.layer.shadowRadius = 4.0
    }
    
    func displayWheaterData(description: (String)) {

    }
}

