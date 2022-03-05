//
//  MoviesViewController.swift
//  Flix_Zuberbuhler
//
//  Created by Zuberbuhler on 2/25/22.
//

import UIKit
import AlamofireImage

//make view controller work with table view
class MoviesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    //properties:
    var movies = [[String:Any]]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self

        // Do any additional setup after loading the view.
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]

                 self.movies = dataDictionary["results"] as! [[String:Any]]
                 print(self.movies)
                    // TODO: Get the array of movies
                    // TODO: Store the movies in a property to use elsewhere
                    // TODO: Reload your table view data
                 
                 //downloading movies is complete
                 self.tableView.reloadData()

             }
        }
        task.resume()
    }
    
    //this tells the other tableView function how many times to run
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
        
        let movie = movies[indexPath.row]
        let title = movie["title"] as! String
        let synopsis = movie["overview"] as! String
        let baseURL = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterURL = URL(string: baseURL + posterPath)
        
        
        cell.posterView.af_setImage(withURL: posterURL!)
        
        cell.titleLabel.text = title
        cell.synopsisLabel.text = synopsis
        
        return cell
    }
    


//     MARK: - Navigation

//     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//         Get the new view controller using segue.destination.
//         Pass the selected object to the new view controller.
        print("Loading up details screen")
        
        //find the selected movie!
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)!
        
        let movie = movies[indexPath.row]
        
        if segue.identifier == "toDetails"
        {
            let detailsViewController = segue.destination as! MovieDetailsViewController
            
            //pass movie selected into navigation 
            detailsViewController.movie = movie
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        //pass selected movie to details view controller!
    }


}
