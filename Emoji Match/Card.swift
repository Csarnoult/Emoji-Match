//Card is UI independent!! That's why the identifier is not like an emoji or some other UI-dependent thing.
//This is how the game is played, part of the MODEL.
//  Card.swift
//  Emoji Match
//
//  Created by Chris Arnoult on 3/3/18.
//  Copyright © 2018 Chris Arnoult. All rights reserved.
//
//Structs has no inheritance. Structs are value types, and classes are reference types. Value types are copied (not referenced).

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    //inits typically have the same external name as the internal name (so one parameter)
    //self is for the cards properties.
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
