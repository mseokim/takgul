//
//  ViewController.swift
//  takGul
//
//  Created by 김민서 on 2017. 8. 6..
//  Copyright © 2017년 김민서. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var backGround: UIImageView!
    @IBOutlet weak var btnStart: UIButton!
    
    @IBOutlet weak var logo_perfect: UIImageView!
    
    @IBOutlet weak var stickTop_2:NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        btnStart.alpha = 0
        logo_perfect.alpha = 0
        
        stickTop_2.constant = 23
        
        
        UIView.animate(withDuration: 3.0, animations: {
            self.logo_perfect.alpha = 1.0
            
        })
        
        
        
        
        UIView.animate(withDuration: 3.0, animations: {
            self.btnStart.alpha = 1.0
        })
        
        
        stickTop_2.constant = 127
        
        UIView.animate(withDuration: 1.8, animations: {
            self.view.layoutIfNeeded()
        })

        // Do any additional setup after loading the view, typically from a nib.
    }
}

