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
    
    // システムの手を記録する変数(0, 1, 2)
    var systemHandNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func playerHandsTapped(_ sender: UIButton) {
        var newSystemHandNumber: Int
        // システムの出す次の手をランダムに生成(前の手と異なるものになるまで実行)
        repeat {
            newSystemHandNumber = Int.random(in: 0..<3)
        } while systemHandNumber == newSystemHandNumber
        systemHandNumber = newSystemHandNumber
        
        if systemHandNumber == 0 {
            systemHandImage.image = UIImage(named: "gu")
        } else if systemHandNumber == 1 {
            systemHandImage.image = UIImage(named: "choki")
        } else if systemHandNumber == 2 {
            systemHandImage.image = UIImage(named: "pa")
        }
    }
    
}

