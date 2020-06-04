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
            //左にスワイプ
            if card.center.x < 75 {
                UIView.animate(withDuration: 0.2, animations: {
                    card.center = CGPoint(x: card.center.x - 250, y: card.center.y)
                })
                return  //この後の元に戻る処理をしたくない為、関数から抜ける
            //右にスワイプ
            }else if card.center.x > self.view.frame.width - 75 {
                UIView.animate(withDuration: 0.2, animations: {
                    card.center = CGPoint(x: card.center.x + 250, y: card.center.y)
                })
                return
            }
            
            
            
            //元に戻る処理
            UIView.animate(withDuration: 0.2, animations: {
                card.center = self.centerOfCard
            })
           
        }
    }
    
}

