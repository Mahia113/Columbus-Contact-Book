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
    
    @IBOutlet weak var temlLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var direcctionLabel: UILabel!
    @IBOutlet weak var transparencyLabel: UILabel!
    @IBOutlet weak var indexLabel: UILabel!
    
    private let homePresenter: HomePresenter = HomePresenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        homePresenter.setViewDelegate(homeViewControllerDelegate: self)
        customViewContainer()
        customViewWeather()
        getWeatherData()
    }
    
    @IBAction func addContactEvent(_ sender: Any) {
        homePresenter.goToAddContact(controller: self)
    }
    
    @IBAction func showListContactEvent(_ sender: Any) {
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
    
    func getWeatherData(){
        homePresenter.getWeatherDataFromApi()
    }
    
    func displayWheaterData(data: DataseriesModel) {
        DispatchQueue.main.async {
            self.temlLabel.text = String(data.temp2m)
            self.speedLabel.text = String(data.wind10m.speed)
            self.direcctionLabel.text = data.wind10m.direction
            self.transparencyLabel.text = String(data.transparency)
            self.indexLabel.text = String(data.lifted_index)
        }
        
    }
    
    func errorFetchingWeatherData(error: Error) {        
        DispatchQueue.main.async {
            self.alert(message: "Ocurrio un error al obtener los datos del clima. Razón: \(error)", title: "Lo sentimos")
        }
    }
    
}

extension UIViewController {
  func alert(message: String, title: String = "") {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let OKAction = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
    alertController.addAction(OKAction)
    self.present(alertController, animated: true, completion: nil)
  }
}

