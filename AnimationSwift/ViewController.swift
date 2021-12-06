//
//  ViewController.swift
//  AnimationSwift
//
//  Created by Eugene on 06.12.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var viewForAnimation: UIView!
    
    var animator: UIViewPropertyAnimator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewForAnimation.center = view.center
        
        animator = UIViewPropertyAnimator(duration: 1.5, curve: .easeInOut, animations: {
            self.viewForAnimation.transform = .init(scaleX: 1.5, y: 1.5)
            self.viewForAnimation.backgroundColor = .red
        })
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        animator.startAnimation()
    }


}

