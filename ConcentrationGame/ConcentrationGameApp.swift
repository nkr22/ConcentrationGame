//
//  ConcentrationGameApp.swift
//  ConcentrationGame
//
//  Created by Noelia Root on 10/3/23.
//

import SwiftUI

@main
struct ConcentrationGameApp: App {
    var body: some Scene {
        WindowGroup {
            ConcentrationGameView(emojiGame: EmojiConcentrationGame())
        }
    }
}
