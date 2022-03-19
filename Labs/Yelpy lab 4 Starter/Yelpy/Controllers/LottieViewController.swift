    //
//  LottieViewController.swift
//  Yelpy
//
//  Created by Zuberbuhler on 3/18/22.
//  Copyright © 2022 memo. All rights reserved.
//

import UIKit
import Lottie

class LottieViewController: UIViewController {

    private var animationView: AnimationView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        animationView = .init(name: "../Extra/99362-animation-no-face.json")
        
        animationView.frame = view.bounds
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = 5
        view.addSubview(animationView)
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        animationView.play()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
