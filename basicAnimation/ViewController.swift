//
//  ViewController.swift
//  basicAnimation
//
//  Created by UW-IN-LPT0108 on 3/15/22.
//

import UIKit

class ViewController: UIViewController {

    let basicView = UIView()
    
    var yAnchor: NSLayoutConstraint!
    var heightAnchor: NSLayoutConstraint!
    var widthAnchor: NSLayoutConstraint!
    
    var tapped = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        basicView.backgroundColor = .blue
        
        basicView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(basicView)
        
        yAnchor = basicView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        yAnchor.isActive = true
        
        basicView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        heightAnchor = basicView.heightAnchor.constraint(equalToConstant: 200)
        heightAnchor.isActive = true
        
        widthAnchor = basicView.widthAnchor.constraint(equalToConstant: 200)
        widthAnchor.isActive = true
        
        perform(#selector(animateBox), with: nil, afterDelay: 1)
        
        basicView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(animateOnTap)))
    }

    @objc fileprivate func animateBox() {
        
        yAnchor.isActive = false
        yAnchor = basicView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0)
        yAnchor.isActive = true
        
        heightAnchor.isActive = false
        heightAnchor = basicView.heightAnchor.constraint(equalToConstant: view.frame.height - 100)
        heightAnchor.isActive = true
        
        widthAnchor.isActive = false
        widthAnchor = basicView.widthAnchor.constraint(equalToConstant: view.frame.width - 50)
        widthAnchor.isActive = true
        
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 1.5, options: .curveEaseIn) {
            self.view.layoutSubviews()
        } completion: { _ in
            
        }
    }
    
    @objc fileprivate func animateOnTap() {
        if tapped {
            widthAnchor.isActive = false
            widthAnchor = basicView.widthAnchor.constraint(equalToConstant: view.frame.width/2)
            widthAnchor.isActive = true
        } else {
            yAnchor.isActive = false
            yAnchor = basicView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 200)
            yAnchor.isActive = true
            
            heightAnchor.isActive = false
            heightAnchor = basicView.heightAnchor.constraint(equalToConstant: 200)
            heightAnchor.isActive = true
            
            widthAnchor.isActive = false
            widthAnchor = basicView.widthAnchor.constraint(equalToConstant: view.frame.width - 20)
            widthAnchor.isActive = true
        }
        
        tapped = !tapped
        
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 1.5, options: .curveEaseIn) {
            self.view.layoutSubviews()
        } completion: { _ in
            
        }
    }
}

