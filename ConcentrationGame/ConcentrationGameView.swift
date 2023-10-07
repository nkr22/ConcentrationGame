//
//  ConcentrationGameView.swift
//  ConcentrationGame
//
//  Created by Noelia Root on 10/3/23.
//

import SwiftUI

struct ConcentrationGameView: View {
    let emojiGame: EmojiConcentrationGame
    var body: some View {
        GeometryReader { geometry in
            VStack {
                LazyVGrid(columns: columns(for: geometry.size)) {
                    ForEach(emojiGame.cards) { card in
                        CardView(card: card)
                            .onTapGesture{
                                emojiGame.choose(card)
                            }
                    }
                }
                
                Spacer()
                HStack{
                    Button("New Game") {
                        emojiGame.newGame()
                    }
                    Spacer()
                    Text("Score: \(emojiGame.score)")
                }
            }
            .padding()
        }
    }
    
    //MARK: - Drawing Constants
    
    private struct Game {
        static let desiredCardWidth = 125.0
    }
    
    private func columns(for size: CGSize) -> [GridItem] {
        Array(repeating: GridItem(.flexible()), count: Int(size.width / Game.desiredCardWidth))
    }
}

#Preview {
    ConcentrationGameView(emojiGame: EmojiConcentrationGame())
}
