//
//  ViewController.swift
//  AnimationSwift
//
//  Created by Eugene on 06.12.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var viewForAnimation: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        UIView.animate(withDuration: 2.0){
//            self.viewForAnimation.center = self.view.center
//            self.viewForAnimation.alpha = 0.0
//        }
        
        self.viewForAnimation.frame.origin.x = 0
        
        UIView.animateKeyframes(withDuration: 3.0, delay: 0.2, options: .repeat) {
            self.viewForAnimation.center = self.view.center
            self.viewForAnimation.transform = CGAffineTransform(rotationAngle: (3 * .pi)/2)
        } completion: { <#Bool#> in
            <#code#>
        }

        
    }


}

