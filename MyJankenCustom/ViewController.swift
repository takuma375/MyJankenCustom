//
//  ViewController.swift
//  MyJankenCustom
//
//  Created by takuma on 2021/08/28.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var totalScoreLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var systemHandImage: UIImageView!
    @IBOutlet weak var playerHandLabel: UILabel!
    @IBOutlet var playerHandsButton: [UIButton]!
    
    // じゃんけんのゲームの状態を管理する変数
    var janken: Janken!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        janken = Janken(systemHandNumber: 0, playerHandNumber: 0)
    }

    @IBAction func playerHandsTapped(_ sender: UIButton) {
        // システムの出す手を更新
        janken.getNextSystemHand()
        
        // プレイヤーの出した手を取得する処理
        guard let playerHandString = sender.titleLabel?.text else {
            return
        }
        let playerHandNumber = Int(playerHandString)!
        janken.playerHandNumber = playerHandNumber
        
        // UIの更新処理を行う
        updateUI()
    }
    
    // UIの更新処理
    func updateUI() {
        resultLabel.text = janken.generateResultLabelText()
        systemHandImage.image = UIImage(named: janken.handNumberToImageName())
        playerHandLabel.text = "\(janken.handNumberToHandName())を出しました"
        totalScoreLabel.text = janken.getTotalGameResults()
    }
    
    
}

