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
    @IBOutlet weak var likeImageView: UIImageView!
    
    
    var centerOfCard:CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        centerOfCard = basicCard.center
    }

    
    @IBAction func swipeCard(_ sender: UIPanGestureRecognizer) {
        let card = sender.view!
        let point = sender.translation(in: view)
        
        card.center = CGPoint(x: card.center.x + point.x, y: card.center.y + point.y)
        
        let xFromCenter = card.center.x - view.center.x //カードスワイプ時、真ん中からの距離
        card.transform = CGAffineTransform(rotationAngle: xFromCenter / (view.frame.width / 2) * -0.785)//角度45度傾けてスワイプ感を出す
        
        if xFromCenter > 0 {
            likeImageView.image = UIImage(named: "good")
            likeImageView.alpha = 1
            likeImageView.tintColor = UIColor.red
        }else if xFromCenter < 0 {
            likeImageView.image = UIImage(named: "bad")
            likeImageView.alpha = 1
            likeImageView.tintColor = UIColor.blue
        }
        
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
                card.transform = .identity
            })
            likeImageView.alpha = 0
        }
    }
    
    
}

