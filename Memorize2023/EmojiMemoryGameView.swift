//
//  ContentView.swift
//  Memorize2023
//
//  Created by Albert Jordan on 10/22/23.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame = EmojiMemoryGame()

    var body: some View {
        VStack {
            ScrollView {
                       cards
                    .animation(.default, value: viewModel.cards)
                   }
            Button("Shuffle") {
                viewModel.shuffle()
            }
        }
        
    }
    
    
    var cards: some View {
        
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100), spacing: 0)]) {
            ForEach(viewModel.cards) { card in
                CardView(card: card)
                }.aspectRatio(2/3, contentMode: .fill)
                .padding(2)
        }.padding(.horizontal)
            .foregroundColor(.orange)
    }
    
    
}


struct CardView: View {
   
    let card: MemoryGame<String>.Card

    var body: some View {
        
        
        
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 3)
                Text(card.content)
                    .font(.system(size:200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(contentMode: .fit)
                
            }
            .opacity(card.isFaceUp ? 1: 0)
            base.fill().opacity(card.isFaceUp ? 0 : 1)
            
        }
        
    }
        
        
    
    
}


struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
