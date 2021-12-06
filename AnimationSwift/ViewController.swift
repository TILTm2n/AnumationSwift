//
//  ViewController.swift
//  AnimationSwift
//
//  Created by Eugene on 06.12.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var viewForAnimation: UIView!
    
    @IBOutlet weak var viewCenterYConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        UIView.animate(withDuration: 2.0){
//            self.viewForAnimation.center = self.view.center
//            self.viewForAnimation.alpha = 0.0
//        }
        
        self.viewForAnimation.frame.origin.x = 0
        
//        UIView.animateKeyframes(withDuration: 1.0, delay: 0.2, options: [.repeat, .autoreverse], animations: {
//            self.viewForAnimation.frame.origin.x = self.view.bounds.maxX - self.viewForAnimation.bounds.width
//
//            UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.3) {
//                self.viewForAnimation.backgroundColor = .red
//            }
//
//            UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.5) {
//                self.viewForAnimation.alpha = 0.5
//                self.viewForAnimation.transform = .init(rotationAngle: .pi)
//            }
//
//        }, completion: nil)
        
        UIView.animate(withDuration: 2.5,
                       delay: 0.1,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 2.0,
                       options: [.curveLinear, .curveEaseInOut],
                       animations: {
            self.viewForAnimation.frame.origin.x =
            self.view.bounds.maxX - self.viewForAnimation.bounds.width
        },
                       completion: nil)
        
    }


}

