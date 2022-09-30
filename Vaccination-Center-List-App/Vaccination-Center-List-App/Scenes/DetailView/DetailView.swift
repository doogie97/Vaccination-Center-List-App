//
//  DetailView.swift
//  Vaccination-Center-List-App
//
//  Created by 최최성균 on 2022/09/29.
//

import SnapKit

final class DetailView: UIView {
    
    private func makeDescriptionLabel() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .footnote)
        return label
    }
}
