//
//  ViewController.swift
//  MyJankenCustom
//
//  Created by takuma on 2021/08/28.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var systemHandImage: UIImageView!
    @IBOutlet weak var playerHandLabel: UILabel!
    @IBOutlet var playerHandsButton: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func playerHandsTapped(_ sender: UIButton) {
        resultLabel.text = "あなたの勝ちです"
        systemHandImage.image = UIImage(named: "gu")
        playerHandLabel.text = "パーを出しました"
    }
    
}

