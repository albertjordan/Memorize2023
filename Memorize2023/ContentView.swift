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
    
    
    var addButton : some View {
        
        Button(action: {
            cardCount += 1
        }, label: {
            Image(systemName: "plus.rectangle.on.folder.fill" )
                
        }).font(.largeTitle)
            .imageScale((.large))
        
    }
    
    var deleteButton : some View {
        Button(action: {
            cardCount -= 1
        }, label: {
            Image(systemName: "folder.badge.minus.fill" )
                
        }).font(.largeTitle)
            .imageScale((.large))
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
