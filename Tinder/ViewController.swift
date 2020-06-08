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
    
    @IBOutlet weak var person1: UIView!
    @IBOutlet weak var person2: UIView!
    @IBOutlet weak var person3: UIView!
    @IBOutlet weak var person4: UIView!
    @IBOutlet weak var person5: UIView!
    
    var centerOfCard:CGPoint!
    var people = [UIView]()
    var selectedCardCount: Int = 0
    
    let name = ["タダシ","クワガタ","大貫さん","カツオ","キャナイチュン"]
    var likedName = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        centerOfCard = basicCard.center
        people.append(person1)
        people.append(person2)
        people.append(person3)
        people.append(person4)
        people.append(person5)
    }
    
    func resetCard(){
       basicCard.center = self.centerOfCard
        basicCard.transform = .identity
    }
    

    
    @IBAction func swipeCard(_ sender: UIPanGestureRecognizer) {
        let card = sender.view!
        let point = sender.translation(in: view)
        
        card.center = CGPoint(x: card.center.x + point.x, y: card.center.y + point.y)
        people[selectedCardCount].center = CGPoint(x: card.center.x + point.x, y: card.center.x + point.y)
        
        let xFromCenter = card.center.x - view.center.x //カードスワイプ時、真ん中からの距離
        card.transform = CGAffineTransform(rotationAngle: xFromCenter / (view.frame.width / 2) * -0.785)//角度45度傾けてスワイプ感を出す
        people[selectedCardCount].transform = CGAffineTransform(rotationAngle: xFromCenter / (view.frame.width / 2) * -0.785)
        
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
                    self.resetCard()
                    self.people[self.selectedCardCount].center = CGPoint(x: self.people[self.selectedCardCount].center.x - 250, y: self.people[self.selectedCardCount].center.y)
                })
                likeImageView.alpha = 0
                selectedCardCount += 1
                if selectedCardCount >= people.count{
                    performSegue(withIdentifier: "PushList", sender: self)
                }
                return  //この後の元に戻る処理をしたくない為、関数から抜ける
            //右にスワイプ
            }else if card.center.x > self.view.frame.width - 75 {
                UIView.animate(withDuration: 0.2, animations: {
                    self.resetCard()
                    self.people[self.selectedCardCount].center = CGPoint(x: self.people[self.selectedCardCount].center.x + 250, y: self.people[self.selectedCardCount].center.y)
                })
                likeImageView.alpha = 0
                likedName.append(name[selectedCardCount])
                selectedCardCount += 1
                if selectedCardCount >= people.count{
                    performSegue(withIdentifier: "PushList", sender: self)
                }
                return
            }
            
            
            //元に戻る処理
            UIView.animate(withDuration: 0.2, animations: {
                self.resetCard()
                self.people[self.selectedCardCount].center = self.centerOfCard//位置
                self.people[self.selectedCardCount].transform = .identity//角度
            })
            likeImageView.alpha = 0
        }
    }
    
    
}

