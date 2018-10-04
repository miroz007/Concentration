//
//  Concentration.swift
//  Concentration
//
//  Created by Amir Samir on 10/3/18.
//  Copyright © 2018 Amir Samir. All rights reserved.
//

import Foundation

class Concentration {
    
    var cards = [Card]()
    
    func chooseCard(at index: Int){
        if cards[index].isFaceUp {
            cards[index].isFaceUp = false
        } else {
            cards[index].isFaceUp = true
        }
    }
    
    init (numberOfPairsOfCards: Int){
        for _ in 1...numberOfPairsOfCards{
            let card = Card()
            cards += [card , card] 
        }
        // TODO: Shuffle The Cards
    }
}
