//
//  ContentView.swift
//  Memorize2023
//
//  Created by Albert Jordan on 10/22/23.
//

import SwiftUI

struct ContentView: View {
    @State var cardCount = 4

    var body: some View {
        let emojis = ["🕷️","🎃","👻","🕸️","🧙‍♀️","👿"]
        VStack {
            HStack {
                ForEach(0..<cardCount, id:\.self) { index in
                    CardView(content: emojis[index])
                }
            }
                
            HStack {
                Button("add card") {
                    cardCount += 1
                    print("add")
                }
                Spacer()
                Button("delete card") {
                    cardCount -= 1
                    print("delete")
                }
            }
            .padding()
        }
        
        
        
        
        
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
