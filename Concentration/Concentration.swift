
import Foundation

struct Concentration {
    
    private(set) var cards = [Card]()
    
    private var indexOfOneAtOnlyFaceUpCard: Int? {
        get {
            return cards.indices.filter{cards[$0].isFaceUp}.oneAndOnly
            
//            var foundIndex: Int?
//            for index in cards.indices {
//                if cards[index].isFaceUp {
//                    if foundIndex == nil {
//                        foundIndex = index
//                    } else {
//                        return nil
//                    }
//                }
//            }
//            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    mutating func chooseCard(at index: Int){
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): Chose index not in the cards")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAtOnlyFaceUpCard , matchIndex != index {
                if cards[matchIndex] == cards[index]{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneAtOnlyFaceUpCard = index
            }
        }
    }
    
    init (numberOfPairsOfCards: Int){
        assert(numberOfPairsOfCards > 0, "Concentration.init(\(numberOfPairsOfCards)): You must have at least one pair of cards" )
        for _ in 1...numberOfPairsOfCards{
            let card = Card()
            cards += [card , card] 
        }
        // TODO: Shuffle The Cards
    }
}


extension Collection {
    var oneAndOnly : Element? {
        return count == 1 ? first : nil
    }
}
