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
            updateViewFromModel()
            
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
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 0) : #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
            }
        }
    }
    
    var emojiChoices = ["🐧","🦀","🐳","🐉","🙊","🐢","🐌","🐔","🐡"]
    
    var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String {
        //back to back if statements can be separated with a comma.
        //If the emoji for this card identifier is not set, and if we have emoji choices, then go get one.
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            //randomIndex is a randomly assigned int to one of the indicies of emojiChoices.
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            //this will remove a card at the random index in the array.
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
        
        /* This code is so common it has it's own syntax as shown above. (If you wanna get something if it's an optional and if it's set, then return it. And if it's not, then handle it)
        if emoji[card.identifier] != nil {
            return emoji[card.identifier]!
        } else {
            return "?"
        } */
    }
}

