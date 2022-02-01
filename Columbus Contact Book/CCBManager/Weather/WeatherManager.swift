//
//  WeatherManager.swift
//  Columbus Contact Book
//
//  Created by Mahia113
//

import Foundation
import Combine
import UIKit

public struct WeatherManager {
    
    private let client: CCBManager
    private let URL = "https://www.7timer.info/bin/astro.php?lon=113.2&lat=23.1&ac=0&unit=metric&output=json&tzshift=0"
    private let networkHandler: NetworkHandler = NetworkHandler()
    
    public init(client: CCBManager){
        self.client = client
    }
    
    func getWeatherData()  -> Future <WeatherModel, Error> {
        return Future() { promise in
            
            networkHandler.performAPIRequestByURL(url: URL) {
                switch $0 {
                    case .success(let data):
                        if let WeatherData: WeatherModel = self.networkHandler.decodeJSONData(data: data){
                            promise(.success(WeatherData))
                        }
                    case .failure(let error):
                        promise(.failure(error))
                }
            }
            
        }
    }
    
}
