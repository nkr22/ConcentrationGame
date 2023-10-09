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
    private var isVisible = false
    
    static func createGame() -> ConcentrationGame<String> {
        ConcentrationGame<String>(numberOfPairsOfCards: Int.random(in: 2...emojis.count)) { emojis[$0] }
    }
    
    //MARK: - Model Access
    
    var dealtCards: Array<ConcentrationGame<String>.Card> {
        isVisible ? game.cards : []
    }
    
    
    var score: Int {
        game.score
    }
    
    //MARK: - User Intents
    
    func choose(_ card: ConcentrationGame<String>.Card) {
        withAnimation(.easeIn(duration: Constants.animationDuration)){
            game.choose(card)
        }
    }
    
    func dealCards() {
        withAnimation(.easeInOut(duration: Constants.animationDuration)){
            isVisible = true
        }
    }
    
    func newGame() {
        withAnimation(.easeInOut(duration: Constants.animationDuration)){
            isVisible = false
            game = EmojiConcentrationGame.createGame()
            dealCards()
        }
    }
    
    //MARK: - Constants
    
    private struct Constants {
        static let animationDuration = 0.5
    }
}
