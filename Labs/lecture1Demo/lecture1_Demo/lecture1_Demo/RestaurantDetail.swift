//
//  RestaurantDetail.swift
//  lecture1_Demo
//
//  Created by Zuberbuhler on 3/3/22.
//

import Foundation

struct RestaurantDetail: Codable
{
    enum CodingKeys: String, CodingKey {
        case name
        case imageURL = "image_url"
        case isClosed = "is_closed"
        case priceRange = "price"
        case photos
    }
    
    let name: String
    let imageURL: String
    let isClosed: Bool
    let priceRange: String
    let photos: [String]
}
