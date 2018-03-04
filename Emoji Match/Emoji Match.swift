//
//  Emoji Match.swift
//  Emoji Match
//
//  Created by Chris Arnoult on 3/3/18.
//  Copyright © 2018 Chris Arnoult. All rights reserved.
//
//This is the model.

import Foundation

class EmojiMatch {
    
    var cards = [Card]()
    
    func chooseCard(at index: Int) {
        if cards[index].isFaceUp {
            cards[index].isFaceUp = false
        } else {
            cards[index].isFaceUp = true
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            //Card is a struct so every time card is being used, it's a copy of Card.
            let card = Card()
            cards += [card, card]
        }
        //TODO: Shuffle the cards.
    }
    
    
    
    
    
}
