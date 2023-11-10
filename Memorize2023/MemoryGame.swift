//
//  MemoryGame.swift
//  Memorize2023
//
//  Created by Albert Jordan on 10/31/23.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    
    var cards: [Card]
    
    init(numberOfPairsOfCards: Int, getCardContent:(Int) -> CardContent ) {
        cards = []
        for index in 0..<numberOfPairsOfCards {
            let content = getCardContent(index)
            cards.append(Card(content: content, id: "1a - \(index)"))
            cards.append(Card(content: content, id: "1b - \(index)"))
        }
    }
    
    
    func choose (card: Card) {
        
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    struct Card: Equatable, Identifiable {
        
        
        let isFaceUp = true
        let isMatched = false
        let content: CardContent
        
        var id: String

        
    }
    
}
