//
//  WeatherModels.swift
//  Columbus Contact Book
//
//  Created by Mahia113
//

import Foundation


public struct WeatherModel: Codable {
    let product: String
    let `init`: String
    let dataseries: [DataseriesModel]
}

public struct DataseriesModel: Codable {
    public let temp2m: Int
    public let transparency: Int
    public let lifted_index: Int
    public let wind10m: Wind10msModel
}

public struct Wind10msModel: Codable {
    public let direction: String
    public let speed: Int
}
