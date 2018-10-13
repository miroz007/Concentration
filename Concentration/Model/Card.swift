//
//  Card.swift
//  Concentration
//
//  Created by Amir Samir on 10/3/18.
//  Copyright © 2018 Amir Samir. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() { self.identifier = Card.getUniqueIdentifier() }
}
