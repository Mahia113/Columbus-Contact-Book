//
//  HomePresenter.swift
//  Columbus Contact Book
//
//  Created by Mahia113
//

import UIKit
import Combine

protocol HomeViewControllerDelegate: NSObjectProtocol {
    func displayWheaterData(data: DataseriesModel)
    func errorFetchingWeatherData(error: Error)
}

class HomePresenter {
    
    weak private var homeViewControllerDelegate: HomeViewControllerDelegate?
    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    let ccbManager: CCBManager = CCBManager()
    var cancellable: AnyCancellable?
    
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
        controller.present(contactListViewController, animated: true, completion: nil)
    }
    
    func getWeatherDataFromApi(){
        
        cancellable = ccbManager.WeatherManager().getWeatherData().sink(receiveCompletion: {completion in
            switch completion {
            case .failure(let error):
                // Rendering a description of the error that was encountered:
                print("failure: \(error)")
                self.homeViewControllerDelegate?.errorFetchingWeatherData(error: error)
            case .finished:
                print("Success")
                break
            }
        }, receiveValue: { weatherData in
            
            let data = weatherData.dataseries[0]
            
            self.homeViewControllerDelegate?.displayWheaterData(data: data)
            
        })
    
    }
    
}
