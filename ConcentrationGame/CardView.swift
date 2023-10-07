//
//  CardView.swift
//  ConcentrationGame
//
//  Created by Noelia Root on 10/7/23.
//

import SwiftUI

struct CardView: View {
    let card: ConcentrationGame<String>.Card
    
    @State private var animatedBonusRemaining = 0.0

    var body: some View{
        GeometryReader {geometry in
            ZStack{
                let animation = Animation.linear(duration: 0.5).repeatForever(autoreverses: false)
                if !card.isMatched || card.isFaceUp {
                    Group {
                        if card.isConsumingBonusTime {
                            Pie(
                                startAngle: angle(for: 0),
                                endAngle: angle(for: -animatedBonusRemaining)
                            )
                            .onAppear {
                                animatedBonusRemaining = card.bonusRemainingPercent
                                withAnimation(.linear(duration: card.bonusTimeRemaining)) {
                                    animatedBonusRemaining = 0
                                }
                            }
                           
                        } else {
                            Pie(
                                startAngle: angle(for: 0),
                                endAngle: angle(for: -card.bonusRemainingPercent)
                            )
                            
                        }
                    }
                        .opacity(0.4)
                        .padding(geometry.size.width * Card.paddingScaleFactor)
                    Text(card.content)
                        .font(systemFont(for: geometry.size))
                        .rotationEffect(Angle(degrees: card.isMatched ? 360 : 0))
                        .animation(animation, value: card.isMatched)
                } else {
                    RoundedRectangle(cornerRadius: Card.cornerRadius)
                }
            }
            .cardify(isFaceUp: card.isFaceUp)
            .foregroundStyle(.blue)
        }
        .aspectRatio(Card.aspectRatio, contentMode: .fit)
    }
    
    // MARK: - Helper
    private func angle(for percentOfCircle: Double) -> Angle {
        Angle.degrees(percentOfCircle * 360 - 90)
    }
    
    private func systemFont(for size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * Card.fontScaleFactor)
    }
    
    // MARK: - Drawing Constants
    private struct Card {
        static let aspectRatio: Double = 2/3
        static let cornerRadius: Double = 10
        static let fontScaleFactor = 0.75
        static let paddingScaleFactor = 0.04
    }
    
}

#Preview {
    CardView(card: ConcentrationGame<String>.Card(isFaceUp: true, content: "🥨"))
        .padding(50)
}
