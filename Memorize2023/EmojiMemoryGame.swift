//
//  EmojiMemoryGame.swift
//  Memorize2023
//
//  Created by Albert Jordan on 10/31/23.
//

import SwiftUI


class EmojiMemoryGame : ObservableObject {
    
    static let emojis = ["🕷️","🎃","👻","🕸️","🧙‍♀️","👿"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 5) { index in
            if emojis.indices.contains(index) {
                return emojis[index]
            } else {
                return "🗑️"
            }
                
        }
    }
    
    @Published var model = createMemoryGame()
    
    
    
   var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    
    
    // Mark: Intents
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    
}
