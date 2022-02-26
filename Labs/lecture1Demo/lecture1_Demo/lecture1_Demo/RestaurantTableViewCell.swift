//
//  RestaurantTableViewCell.swift
//  lecture1_Demo
//
//  Created by Zuberbuhler on 2/24/22.
//

import UIKit
import AlamofireImage

class RestaurantTableViewCell: UITableViewCell {

    @IBOutlet weak var restaurantNameLabel: UILabel!
    @IBOutlet weak var restaurantCategoryLabel: UILabel!
    @IBOutlet weak var restaurantRatingLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var restaurantImageView: UIImageView!
    
    func configure(with restaurant: Restaurant){
        restaurantNameLabel.text = restaurant.name
        restaurantCategoryLabel.text = restaurant.type
        restaurantRatingLabel.text = "Rating: \(restaurant.rating)"
        phoneNumberLabel.text = restaurant.phoneNumber
        restaurantImageView.af.setImage(withURL: URL(string: restaurant.imageURL)!)
    }
}
