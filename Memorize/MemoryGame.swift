//
//  MemoryGame.swift
//  Memorize
//
//  Created by Zappts Development MacMini on 27/05/20.
//  Copyright © 2020 Eduardo Saito. All rights reserved.
//

import Foundation

// MODEL
struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    mutating func choose(card: Card) {
        print("Card chosen: \(card)")
        let chosenIndex: Int = self.index(of: card)
        self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp
    }
    
    func index(of card: Card) -> Int {
        for index in 0..<self.cards.count {
            if self.cards[index].id == card.id { return index }
        }
        return -1 // TODO: Bogus!
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
