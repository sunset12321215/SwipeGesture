//
//  ViewController.swift
//  SwipeGesture
//
//  Created by CuongVX-D1 on 6/17/19.
//  Copyright © 2019 CuongVX-D1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var imageView: UIImageView!
    
    let image = ["English", "Polish", "Spanish"]
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDefaulImage()
        setupSwipeGesture()
    }
    
    private func setDefaulImage() {
        imageView.image = UIImage(named: image[index])
    }
    
    private func setupSwipeGesture() {
        let rightSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipe))
        rightSwipeGesture.direction = .right
        
        let leftSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipe))
        leftSwipeGesture.direction = .left
    
        view.addGestureRecognizer(rightSwipeGesture)
        view.addGestureRecognizer(leftSwipeGesture)
    }
    
    @objc func swipe(sender: UISwipeGestureRecognizer) {
        if sender.state == .ended {
            switch sender.direction {
            case .right:
                index += 1
                if index == image.count {
                    index = image.count - 1
                }
            case .left:
                index -= 1
                if index == -1 {
                    index = 0
                }
            default:
                break
            }
            
            
            
            imageView.image = UIImage(named: image[index])
        }
    }
}

