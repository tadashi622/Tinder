//
//  ViewController.swift
//  Tinder
//
//  Created by Tadashi Yoshimura on 2020/05/29.
//  Copyright © 2020 Tadashi Yoshimura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var basicCard: UIView!
    
    var centerOfCard:CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        centerOfCard = basicCard.center
    }

    
    @IBAction func swipeCard(_ sender: UIPanGestureRecognizer) {
        let card = sender.view!
        let point = sender.translation(in: view)
        
        card.center = CGPoint(x: card.center.x + point.x, y: card.center.y + point.y)
        
        if sender.state == UIGestureRecognizer.State.ended{
            UIView.animate(withDuration: 0.2, animations: {
                card.center = self.centerOfCard
            })
           
        }
    }
    
}

