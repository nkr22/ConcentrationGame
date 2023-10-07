//
//  EmojiConcentrationGame.swift
//  ConcentrationGame
//
//  Created by Noelia Root on 10/4/23.
//

import SwiftUI

@Observable class EmojiConcentrationGame {
    //MARK: - Properties
    
    static let emojis = ["🌦️", "🍣", "🥝", "👠", "🍓", "🥓"]
    
    private var game = createGame()
    
    static func createGame() -> ConcentrationGame<String> {
        ConcentrationGame<String>(numberOfPairsOfCards: Int.random(in: 2...emojis.count)) { emojis[$0] }
    }
    
    //MARK: - Model Access
    
    var cards: Array<ConcentrationGame<String>.Card> {
        game.cards
    }
    
    var score: Int {
        game.score
    }
    
    //MARK: - User Intents
    
    func choose(_ card: ConcentrationGame<String>.Card) {
        game.choose(card)
    }
    
    func newGame() {
        game = EmojiConcentrationGame.createGame()
    }
}
