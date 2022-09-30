//
//  DetailView.swift
//  Vaccination-Center-List-App
//
//  Created by 최최성균 on 2022/09/29.
//

import SnapKit

final class DetailView: UIView {
    private func makeSectionView(imageName: String, titleText: String, descriptionLabel: UILabel) -> UIView {
        let imageView = UIImageView(image: UIImage(named: imageName))
        imageView.contentMode = .scaleAspectFit
        
        let titleTextLabel = UILabel()
        titleTextLabel.text = titleText
        titleTextLabel.textAlignment = .center
        titleTextLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 10
        
        view.addSubview(imageView)
        view.addSubview(titleTextLabel)
        view.addSubview(descriptionLabel)
        
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.height.equalToSuperview().multipliedBy(0.3)
            $0.width.equalTo(imageView.snp.height)
            $0.centerX.equalToSuperview()
        }
        
        titleTextLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.1)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleTextLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(16)
        }

        return view
    }
    
    private func makeDescriptionLabel() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .footnote)
        return label
    }
}
