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
        
        UIView.animate(withDuration: 3.0, animations: {
            self.viewForAnimation.center = self.view.center
            
            self.viewForAnimation.transform = CGAffineTransform(rotationAngle: -.pi/2).scaledBy(x: 2.5, y: 1.75).translatedBy(x: -30, y: 0)
            
        }) { (isFinish) in
            //self.viewForAnimation.alpha = 0.0 // срабатывает когда завершится анимация
            
            UIView.animate(withDuration: 1.0) {
                self.viewForAnimation.transform = .identity
            }
            
            
        }
    }


}

