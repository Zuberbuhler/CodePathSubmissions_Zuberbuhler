//
//  ViewController.swift
//  lecture1_Demo
//
//  Created by Zuberbuhler on 2/24/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var restuarantTableView: UITableView!
    
    private var restaurants = [Restaurant]() {
        didSet {
            restuarantTableView.reloadData()
        }
    }
     
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        restuarantTableView.dataSource = self
        restuarantTableView.delegate = self
        
        RestaurantService.shared.fetchRestaurants{ restaurants in
            self.restaurants = restaurants
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantTableViewCell") as? RestaurantTableViewCell
        else {
            return UITableViewCell()
        }
        
        cell.configure(with: restaurants[indexPath.row])
        return cell
    }
}

