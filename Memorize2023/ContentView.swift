//
//  ContentView.swift
//  Memorize2023
//
//  Created by Albert Jordan on 10/22/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var cardCount = 4
    
    let emojis = ["🕷️","🎃","👻","🕸️","🧙‍♀️","👿"]

    var body: some View {
        
        VStack {
            cards
            Spacer()
            cardCountAdjusters
        }
        
    }
    
    var cardCountAdjusters : some View {
        HStack {
            deleteButton
            Spacer()
            addButton
        }.padding()
    }
    
    
    var cards: some View {
        
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
            ForEach(emojis,id:\.self) { emoji in
                CardView(content: emoji)
            }.aspectRatio(2/3, contentMode: .fill)
        }.padding(.horizontal)
            .foregroundColor(.orange)
    }
    
    func cardCountAdjuster( by Offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += Offset
        }, label: {
            Image(systemName: symbol )
                
        }).font(.largeTitle)
            .imageScale((.large))
        
    }
    
    
    var addButton : some View {
        cardCountAdjuster(by: 1, symbol: "plus.rectangle.on.folder.fill")
    }
    
    var deleteButton : some View {
        cardCountAdjuster(by: 1, symbol: "folder.badge.minus.fill" )
    }
    
    
    
    
}


struct CardView: View {
   
    @State var isFaceUp = true
    var content: String

    var body: some View {
        
        
        
        ZStack {
            let card = RoundedRectangle(cornerRadius: 12)
            
            Group {
                card.fill(.white)
                card.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
                
            }
            .opacity(isFaceUp ? 1: 0)
            card.fill().opacity(isFaceUp ? 0 : 1)
            
        }.onTapGesture {
            isFaceUp.toggle()
        }
        
    }
        
        
    
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
