//
//  ListViewController.swift
//  Tinder
//
//  Created by Tadashi Yoshimura on 2020/06/08.
//  Copyright © 2020 Tadashi Yoshimura. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource {
    
    var likedName = [String]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    //セルの数いくつにするかメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return likedName.count
    }
    //セルの中身
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)//セルの作成
        cell.textLabel?.text = likedName[indexPath.row]
        return cell
    }
}
