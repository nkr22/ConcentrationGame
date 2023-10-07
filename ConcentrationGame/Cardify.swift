//
//  Cardify.swift
//  ConcentrationGame
//
//  Created by Noelia Root on 10/7/23.
//

import SwiftUI

struct Cardify: ViewModifier {
    let isFaceUp: Bool
    
    func body(content: Content) -> some View {
        
        GeometryReader {geometry in
            ZStack{
                if isFaceUp{
                    RoundedRectangle(cornerRadius: cornerRadius(for: geometry.size)).fill(.white)
                    RoundedRectangle(cornerRadius: cornerRadius(for: geometry.size)).stroke()
                    content
                } else {
                    RoundedRectangle(cornerRadius: cornerRadius(for: geometry.size))
                }
            }
        }
    }
    
    // MARK: - Drawing Constants
    private func cornerRadius(for size: CGSize) -> Double {
        min(size.width, size.height) * 0.08
    }
    
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        modifier(Cardify(isFaceUp: isFaceUp))
    }
}
