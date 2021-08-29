//
//  Janken.swift
//  MyJankenCustom
//
//  Created by takuma on 2021/08/29.
//

import Foundation

struct Janken {
    var systemHandNumber: Int
    var playerHandNumber: Int
    var totalWins: Int = 0
    var totalLoses: Int = 0
    var totalDraws: Int = 0
    
    // システムの新たな手を生成するメソッド
    mutating func getNextSystemHand() {
        var newSystemHandNumber: Int
        
        // システムの出す手をランダムに生成
        repeat {
            newSystemHandNumber = Int.random(in: 0..<3)
        } while newSystemHandNumber == self.systemHandNumber
        
        self.systemHandNumber = newSystemHandNumber
    }
    
    // 勝敗判定と試合結果を伝えるラベルのテキストを生成するメソッド
    mutating func generateResultLabelText() -> String {
        var resultLabel = ""
        
        if self.systemHandNumber == self.playerHandNumber {
            resultLabel = "引き分けです。惜しい...！"
            countUpStatus(status: .draw)
        } else {
            if self.systemHandNumber == 0 && self.playerHandNumber == 1 {
                resultLabel = "負けです...残念！"
                countUpStatus(status: .lose)
            } else if self.systemHandNumber == 0 && self.playerHandNumber == 2 {
                resultLabel = "勝ちました！やったね！"
                countUpStatus(status: .win)
            } else if self.systemHandNumber == 1 && self.playerHandNumber == 0 {
                resultLabel = "勝ちました！やったね！"
                countUpStatus(status: .win)
            } else if self.systemHandNumber == 1 && self.playerHandNumber == 2 {
                resultLabel = "負けです...残念！"
                countUpStatus(status: .lose)
            } else if self.systemHandNumber == 2 && self.playerHandNumber == 0 {
                resultLabel = "負けです...残念！"
                countUpStatus(status: .lose)
            } else if self.systemHandNumber == 2 && self.playerHandNumber == 1 {
                resultLabel = "勝ちました！やったね！"
                countUpStatus(status: .win)
            }
        }
        return resultLabel
    }
    
    // 累計勝ち、負け、引き分け回数のラベルテキストを生成するメソッド
    func getTotalGameResults() -> String {
        return "Win: \(totalWins) Lose: \(totalLoses) Draw: \(totalDraws)"
    }
    
    // 勝ち、負け、引き分けの回数を変更するメソッド
    mutating func countUpStatus(status: ResultPattern) {
        if status == .win {
            totalWins += 1
        } else if status == .draw {
            totalDraws += 1
        } else if status == .lose {
            totalLoses += 1
        }
    }
    
    // 手の数字から、手の画像名を取得するメソッド
    func handNumberToImageName() -> String {
        var handImageName = ""
        if self.systemHandNumber == 0 {
            handImageName = "gu"
        } else if self.systemHandNumber == 1 {
            handImageName = "choki"
        } else if self.systemHandNumber == 2 {
            handImageName = "pa"
        }
        return handImageName
    }
    
    // 手の数字から、手の名前を取得するメソッド
    func handNumberToHandName() -> String {
        var handName = ""
        if self.playerHandNumber == 0 {
            handName = "グー"
        } else if self.playerHandNumber == 1 {
            handName = "チョキ"
        } else if self.playerHandNumber == 2 {
            handName = "パー"
        }
        return handName
    }
    
    // 勝ち、負け、引き分けのパターンを定義
    enum ResultPattern {
        case win
        case lose
        case draw
    }
}
