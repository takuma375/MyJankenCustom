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
    
    // 勝敗判定と試合結果を伝えるラベルのテキストを生成するメソッド
    func generateResultLabelText() -> String {
        var resultLabel = ""
        
        if self.systemHandNumber == self.playerHandNumber {
            resultLabel = "引き分けです。惜しい...！"
        } else {
            if self.systemHandNumber == 0 && self.playerHandNumber == 1 {
                resultLabel = "負けです...残念！"
            } else if self.systemHandNumber == 0 && self.playerHandNumber == 2 {
                resultLabel = "勝ちました！やったね！"
            } else if self.systemHandNumber == 1 && self.playerHandNumber == 0 {
                resultLabel = "勝ちました！やったね！"
            } else if self.systemHandNumber == 1 && self.playerHandNumber == 2 {
                resultLabel = "負けです...残念！"
            } else if self.systemHandNumber == 2 && self.playerHandNumber == 0 {
                resultLabel = "負けです...残念！"
            } else if self.systemHandNumber == 2 && self.playerHandNumber == 1 {
                resultLabel = "勝ちました！やったね！"
            }
        }
        return resultLabel
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
}
