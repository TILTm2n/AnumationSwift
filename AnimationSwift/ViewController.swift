//
//  ViewController.swift
//  AnimationSwift
//
//  Created by Eugene on 06.12.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var animator: UIViewPropertyAnimator!
    
    @IBOutlet weak var viewForAnimation: UIView!
    
    @IBAction func didSlide(_ sender: UISlider) {
        animator.fractionComplete = CGFloat(sender.value)/100
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewForAnimation.center = view.center
        
        animator = UIViewPropertyAnimator(duration: 1.5, curve: .easeInOut)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTap))
        
        viewForAnimation.addGestureRecognizer(tapGesture)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }

    @objc
    func didTap(){
        animator.addAnimations {
            self.viewForAnimation.backgroundColor = .red
            
            self.viewForAnimation.layer.cornerRadius = 15
        
            self.viewForAnimation.transform = .init(scaleX: 1.5, y: 1.5)
        }
        
        // position - это enum, который иеет 3 состояния: end = 0 (завершилась), start = 1 (началась), current = 2 (продолжается)
        animator.addCompletion { (position) in
            <#code#>
        }
        
        animator.startAnimation()
        print("sosi")
    }
    

}

