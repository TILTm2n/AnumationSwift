//
//  ViewController.swift
//  AnimationSwift
//
//  Created by Eugene on 06.12.2021.
//

import UIKit

enum AnimationState{
    case open
    case close
}

class ViewController: UIViewController {
    
    var animator: UIViewPropertyAnimator!
    
    var state: AnimationState = .close
    
    @IBOutlet weak var viewForAnimation: UIView!
    
    @IBAction func didSlide(_ sender: UISlider) {
        animator.fractionComplete = CGFloat(sender.value)/100
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewForAnimation.center = view.center
        
        animator = UIViewPropertyAnimator(duration: 1.5, curve: .easeInOut, animations: {
            self.viewForAnimation.backgroundColor = .red
            
            self.viewForAnimation.layer.cornerRadius = 15
        
            self.viewForAnimation.transform = .init(scaleX: 1.5, y: 1.5)
        })
        
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTap))
//
//        viewForAnimation.addGestureRecognizer(tapGesture)
//
//        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(didDoubleTap))
//
//        tapGesture2.numberOfTouchesRequired = 2 //чтобы нажать двумя пальцами надо зажать option [+shift]
//
//        viewForAnimation.addGestureRecognizer(tapGesture2)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(didPan(_:)))
     
        viewForAnimation.addGestureRecognizer(panGesture)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }

    func activateAnimation(){
        switch state{
        case .open: didTap()
        case .close: didDoubleTap()
        }
    }
    
    @objc
    func didPan(_ panGesture: UIPanGestureRecognizer){
        //panGesture.view - через panGesture можно обращаться к view к которой gesture в данный момент привязяно
        let final = (view.bounds.height - viewForAnimation.bounds.height)/2
        let translation = panGesture.translation(in: self.view)
        var currentYTranslation = -translation.y
        
        switch panGesture.state{
            
        case .began:
            activateAnimation()
            animator.pauseAnimation()
        case .changed:
            
            if state == .open {
                currentYTranslation *= -1
            }
            
            animator.fractionComplete = currentYTranslation/final
        case .ended:
            animator.continueAnimation(withTimingParameters: nil, durationFactor: 0)
        default: break
        
//        let currentX = viewForAnimation.center.x
//        let currentY = viewForAnimation.center.y
        
        //viewForAnimation.center = CGPoint(x: currentX + newPosition.x, y: currentY + newPosition.y
        
        //panGesture.setTranslation(.zero, in: self.view)
        }
    }
    
    //@objc
    func didTap(){
        animator.addAnimations {
            self.viewForAnimation.backgroundColor = .red
            
            self.viewForAnimation.layer.cornerRadius = 15
        
            self.viewForAnimation.transform = .init(scaleX: 1.5, y: 1.5)
        }
        
        // position - это enum, который иеет 3 состояния: end = 0 (завершилась), start = 1 (началась), current = 2 (продолжается)
        animator.addCompletion { (position) in
            self.state = .close
        }
        
        animator.startAnimation()
        print("sosi")

    }
    
    //@objc
    func didDoubleTap(){
        animator.addAnimations {
            self.viewForAnimation.transform = .identity
            self.viewForAnimation.backgroundColor = .green
            self.viewForAnimation.layer.cornerRadius = 0
        }
        
        animator.addCompletion { (position) in
            self.state = .open
        }
        
        animator.startAnimation()
        

    }

}


