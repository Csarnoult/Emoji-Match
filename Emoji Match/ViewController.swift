//
//  ViewController.swift
//  Emoji Match
//
//  Created by Chris Arnoult on 2/27/18.
//  Copyright © 2018 Chris Arnoult. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //This is the big green arrow that's communicating from your Controller to your Model.
    lazy var game = EmojiMatch(numberOfPairsOfCards: (cardButtons.count + 1) / 2 )
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips \(flipCount)"
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            //update view from model.
            
        } else {
            print("Fail")
        }
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 0): #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
            }
        }
    }
    
    var emojiChoices = ["🐧","🦀","🐳","🐉","🙊","🐢","🐌","🐔","🐡"]
    
    func emoji(for card: Card) -> String {
        return "?"
    }
    
}

