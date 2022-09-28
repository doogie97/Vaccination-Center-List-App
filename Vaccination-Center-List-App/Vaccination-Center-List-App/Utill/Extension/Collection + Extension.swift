//
//  Collection + Extension.swift
//  Vaccination-Center-List-App
//
//  Created by 최최성균 on 2022/09/28.
//

extension Collection {
    subscript (safe index: Index) -> Element? {
        return self.indices.contains(index) ? self[index] : nil
    }
}

