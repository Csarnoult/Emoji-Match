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
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                //check if cards match.
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                //either no cards are 2 cards are face up.
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
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
