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
    var game: EmojiMatch = EmojiMatch()
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips \(flipCount)"
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    var emojiChoices = ["🐧","🐦","🐧","🐦"]
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        } else {
            print("Fail")
        }
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
}

