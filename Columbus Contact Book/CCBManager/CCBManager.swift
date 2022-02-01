//
//  CCBManager.swift
//  Columbus Contact Book
//
//  Created by Mahia113
//

import Foundation

public struct CCBManager{
    
    public init(){}
    
    public func CCBDataPersistence() -> CCBDataPersistence {
        let ccbDataPersistence = Columbus_Contact_Book.CCBDataPersistence(client: self)
        return ccbDataPersistence
    }
    
    public func WeatherManager() -> WeatherManager {
        let weatherManager = Columbus_Contact_Book.WeatherManager(client: self)
        return weatherManager
    }
    
}
