//
//  DetailView.swift
//  Vaccination-Center-List-App
//
//  Created by 최최성균 on 2022/09/29.
//

import SnapKit

final class DetailView: UIView {
    
    private lazy var centerNameView = makeSectionView(imageName: "hospital", titleText: "센터명", descriptionLabel: centerNameLabel)
    private lazy var centerNameLabel = makeDescriptionLabel()
    
    private lazy var facilityNameView = makeSectionView(imageName: "building", titleText: "건물명", descriptionLabel: facilityNameLabel)
    private lazy var facilityNameLabel = makeDescriptionLabel()
    
    private lazy var phoneNumberView = makeSectionView(imageName: "telephone", titleText: "전화번호", descriptionLabel: phoneNumberLabel)
    private lazy var phoneNumberLabel = makeDescriptionLabel()
    
    private lazy var updatedAtView = makeSectionView(imageName: "chat", titleText: "업데이트 시간", descriptionLabel: updatedAtLabel)
    private lazy var updatedAtLabel = makeDescriptionLabel()
    
    private lazy var addressView = makeSectionView(imageName: "placeholder", titleText: "주소", descriptionLabel: addressLabel)
    private lazy var addressLabel = makeDescriptionLabel()
    
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
