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
        
        HStack {
            ForEach(0..<cardCount, id:\.self) { index in
                CardView(content: emojis[index])
            }
        }
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
            if isFaceUp {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.white)
                    RoundedRectangle(cornerRadius: 12)
                        .strokeBorder(lineWidth: 3)
                    Text(content)
                        .font(.largeTitle)
                }
                .padding(2)
                .foregroundColor(.orange)
            } else {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.orange)
            }
                
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
