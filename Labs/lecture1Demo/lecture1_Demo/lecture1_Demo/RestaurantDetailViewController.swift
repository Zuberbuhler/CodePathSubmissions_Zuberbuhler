//
//  RestaurantDetailViewController.swift
//  lecture1_Demo
//
//  Created by Zuberbuhler on 3/3/22.
//

import UIKit

class RestaurantDetailViewController: UIViewController {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func configure(with id: String)
    {
        RestaurantService.shared.fetchRestaurantDetail(id: id) { [weak self]
            detail in
            self?.nameLabel.text = detail?.name
            
            print(detail?.name)
        }
    }

}
