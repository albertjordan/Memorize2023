//
//  MemoryGame.swift
//  Memorize2023
//
//  Created by Albert Jordan on 10/31/23.
//

import Foundation

struct MemoryGame<CardContent> {
    
    var cards: [Card]
    
    init(numberOfPairsOfCards: Int, getCardContent:(Int) -> CardContent ) {
        cards = []
        for index in 0..<numberOfPairsOfCards {
            let content = getCardContent(index)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    
    func choose (card: Card) {
        
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    struct Card {
        let isFaceUp = true
        let isMatched = false
        let content: CardContent
        
    }
    
}
