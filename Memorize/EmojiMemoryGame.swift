//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Zappts Development MacMini on 27/05/20.
//  Copyright © 2020 Eduardo Saito. All rights reserved.
//

import Foundation

// VIEW-MODEL
class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    /* Instead of using objectWillChange.send() multiple times, that could lead to errors,
        we use the property wrapper @Published, so every time this variable changes it will call objectWillChange.send()  */
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👹", "👽", "👻"] // , "☠️", "🤖", "🎃"
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
