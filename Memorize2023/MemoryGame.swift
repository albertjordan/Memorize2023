//
//  MemoryGame.swift
//  Memorize2023
//
//  Created by Albert Jordan on 10/31/23.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    
    var cards: [Card]
    
    var indexOfOneandOnlyOneFaceUpCard: Int? {
        get{ cards.indices.filter { cards[$0].isFaceUp == true }.only}
        set {cards.indices.forEach {cards[$0].isFaceUp = (newValue == $0)}}
    }
    
    init(numberOfPairsOfCards: Int, getCardContent:(Int) -> CardContent ) {
        cards = []
        for index in 0..<numberOfPairsOfCards {
            let content = getCardContent(index)
            cards.append(Card(content: content, id: "1a - \(index)"))
            cards.append(Card(content: content, id: "1b - \(index)"))
        }
    }
    
    
    mutating func choose (card: Card) {
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}) {
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
                if let potentialMatchedIndex = indexOfOneandOnlyOneFaceUpCard {
                    if cards[chosenIndex].content == cards[potentialMatchedIndex].content {
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatchedIndex].isMatched = true
                    }
                    
                }
                    else {
                        indexOfOneandOnlyOneFaceUpCard = chosenIndex
                    }
                    cards[chosenIndex].isFaceUp = true
                }
            }
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        
        var debugDescription: String {
                "\(content) isMatched: \(isMatched) FaceUp: \(isFaceUp)\n"
            }
        
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        
        let id: String

        
    }
    
}

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
   
}
