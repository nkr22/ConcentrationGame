//
//  Array+Index.swift
//  ConcentrationGame
//
//  Created by Noelia Root on 10/5/23.
//

import Foundation

extension Array where Element: Identifiable{
    func firstIndex(matching targetElement: Element) -> Int? {
        for index in self.indices {
            if self[index].id == targetElement.id {
                return index
            }
        }
        
        return nil
    }
}
