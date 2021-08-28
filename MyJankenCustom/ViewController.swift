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
        
        // プレイヤーの出した手を取得する処理
        guard let playerHandString = sender.titleLabel?.text else {
            return
        }
        let playerHandNumber = Int(playerHandString)!
        let playerHandName = handNumberToHandName(handNumber: playerHandNumber)
        
        let systemHandImageName = handNumberToHandImageName(handNumber: systemHandNumber)
        
        // 勝敗判定と上部ラベルの更新処理
        if systemHandNumber == playerHandNumber {
            resultLabel.text = "引き分けです。惜しい...！"
        } else {
            if systemHandNumber == 0 && playerHandNumber == 1 {
                resultLabel.text = "負けです...残念！"
            } else if systemHandNumber == 0 && playerHandNumber == 2 {
                resultLabel.text = "勝ちました！やったね！"
            } else if systemHandNumber == 1 && playerHandNumber == 0 {
                resultLabel.text = "勝ちました！やったね！"
            } else if systemHandNumber == 1 && playerHandNumber == 2 {
                resultLabel.text = "負けです...残念！"
            } else if systemHandNumber == 2 && playerHandNumber == 0 {
                resultLabel.text = "負けです...残念！"
            } else if systemHandNumber == 2 && playerHandNumber == 1 {
                resultLabel.text = "勝ちました！やったね！"
            }
        }
        // 画像と下部ラベルの更新処理
        systemHandImage.image = UIImage(named: systemHandImageName)
        playerHandLabel.text = "\(playerHandName)を出しました"
    }
    
    // 手の数字から、手の画像名を取得する関数
    func handNumberToHandImageName(handNumber: Int) -> String {
        var handImageName = ""
        if handNumber == 0 {
            handImageName = "gu"
        } else if handNumber == 1 {
            handImageName = "choki"
        } else if handNumber == 2 {
            handImageName = "pa"
        }
        return handImageName
    }
    // 手の数字から、手の名前を取得する関数
    func handNumberToHandName(handNumber: Int) -> String {
        var handName = ""
        if handNumber == 0 {
            handName = "グー"
        } else if handNumber == 1 {
            handName = "チョキ"
        } else if handNumber == 2 {
            handName = "パー"
        }
        return handName
    }
    
}

