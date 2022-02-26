//
//  RestaurantService.swift
//  lecture1_Demo
//
//  Created by Zuberbuhler on 2/24/22.
//

import Foundation

class RestaurantService {
    
    static let shared = RestaurantService()
    
    func fetchRestaurants(completion: @escaping( ([Restaurant]) -> Void) )
    {
        let apikey = "v7t-QuKRd7Cu-p0YXnAc8S6xcnLIEbKOUA-iRZy78DG_8B49cnagdNEo-z_cYBHb5GKCGh1_I-VIlIkazj80hoF6GpWl0rh6i2H4zuuzkva0t2QiV-zMvAONvpbfYXYx"
        
        let lat = 37.773972
        let long = -122.431297
        let url = URL(string: "https://api.yelp.com/v3/transactions/delivery/search?latitude=\(lat)&longitude=\(long)")!
        
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        
        request.setValue("Bearer \(apikey)", forHTTPHeaderField: "Authorization")
        
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: .main)
        
        let task = session.dataTask(with: request) { data, response, error in
            //fill out
            guard error == nil else {
                print("got an error")
                return
            }
            
            guard let data = data else {
                print("got no data")
                return
            }
            
            let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
            let restaurantsRawData = dataDictionary["businesses"] as! [[String: Any]]
            
            var restaurants = [Restaurant]()
            
            for rawData in restaurantsRawData {
                let restaurant = Restaurant(name: rawData["name"] as! String, type: (rawData["categories"] as! [[String: String ]])[0]["title"]!, rating: (rawData["rating"] as! NSNumber).intValue, phoneNumber: rawData["display_phone"] as! String, imageURL: rawData["image_url"] as! String)
                
                restaurants.append(restaurant);
            }
            completion(restaurants)
        }
        
        task.resume()
    }
}
