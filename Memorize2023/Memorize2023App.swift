//
//  Memorize2023App.swift
//  Memorize2023
//
//  Created by Albert Jordan on 10/22/23.
//

import SwiftUI

@main
struct Memorize2023App: App {
    @StateObject var game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
