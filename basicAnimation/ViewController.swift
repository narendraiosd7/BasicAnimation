//
//  ViewController.swift
//  basicAnimation
//
//  Created by UW-IN-LPT0108 on 3/15/22.
//

import UIKit

class ViewController: UIViewController {

    let basicView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        basicView.backgroundColor = .blue
        
        basicView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(basicView)
        
        basicView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        basicView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        basicView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        basicView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        animateBox(with: .red)
    }

    fileprivate func animateBox(with color: UIColor) {
        
        UIView.animate(withDuration: 0.3, delay: 1, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseIn) {
            self.basicView.backgroundColor = color
        } completion: { _ in
            
        }

        
        //basic animation code
//        UIView.animate(withDuration: 1) {
//            self.basicView.backgroundColor = color
//        }
    }
}

