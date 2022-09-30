//
//  DetailView.swift
//  Vaccination-Center-List-App
//
//  Created by 최최성균 on 2022/09/29.
//

import SnapKit

final class DetailView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private let sectionHeight = UIScreen.main.bounds.width * 0.45
    
    //centerName
    private lazy var centerNameView = makeSectionView(imageName: "hospital", titleText: "센터명", descriptionLabel: centerNameLabel)
    private lazy var centerNameLabel = makeDescriptionLabel()
    
    //facilityName
    private lazy var facilityNameView = makeSectionView(imageName: "building", titleText: "건물명", descriptionLabel: facilityNameLabel)
    private lazy var facilityNameLabel = makeDescriptionLabel()
    
    //phoneNumber
    private lazy var phoneNumberView = makeSectionView(imageName: "telephone", titleText: "전화번호", descriptionLabel: phoneNumberLabel)
    private lazy var phoneNumberLabel = makeDescriptionLabel()
    
    //updatedAt
    private lazy var updatedAtView = makeSectionView(imageName: "chat", titleText: "업데이트 시간", descriptionLabel: updatedAtLabel)
    private lazy var updatedAtLabel = makeDescriptionLabel()
    
    //address
    private lazy var addressView = makeSectionView(imageName: "placeholder",
                                                   titleText: "주소",
                                                   descriptionLabel: addressLabel,
                                                   shwdowWith: sectionHeight * 2.15)
    private lazy var addressLabel = makeDescriptionLabel()
    
    //make methods
    private func makeSectionView(imageName: String, titleText: String, descriptionLabel: UILabel, shwdowWith: CGFloat? = nil) -> UIView {
        let imageView = UIImageView(image: UIImage(named: imageName))
        imageView.contentMode = .scaleAspectFit
        
        let titleTextLabel = UILabel()
        titleTextLabel.text = titleText
        titleTextLabel.textAlignment = .center
        titleTextLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 10
        view.setShadow(offset: CGSize(width: 0, height: 15), width: shwdowWith ?? sectionHeight, height: sectionHeight)

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
    
    //setting
    private func setLayout() {
        self.backgroundColor = .systemGray5
        
        self.addSubview(centerNameView)
        self.addSubview(facilityNameView)
        self.addSubview(phoneNumberView)
        self.addSubview(updatedAtView)
        self.addSubview(addressView)
        
        centerNameView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).inset(16)
            $0.leading.equalTo(safeAreaLayoutGuide).inset(20)
            $0.trailing.equalTo(safeAreaLayoutGuide).multipliedBy(0.5).inset(20)
            $0.height.equalTo(sectionHeight)
        }
        
        facilityNameView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).inset(16)
            $0.leading.equalTo(centerNameView.snp.trailing).offset(40)
            $0.trailing.equalTo(safeAreaLayoutGuide).inset(20)
            $0.height.equalTo(sectionHeight)
        }
        
        phoneNumberView.snp.makeConstraints {
            $0.top.equalTo(centerNameView.snp.bottom).offset(24)
            $0.leading.equalTo(safeAreaLayoutGuide).inset(20)
            $0.trailing.equalTo(safeAreaLayoutGuide).multipliedBy(0.5).inset(20)
            $0.height.equalTo(sectionHeight)
        }
        
        updatedAtView.snp.makeConstraints {
            $0.top.equalTo(facilityNameView.snp.bottom).offset(24)
            $0.leading.equalTo(phoneNumberView.snp.trailing).offset(40)
            $0.trailing.equalTo(safeAreaLayoutGuide).inset(20)
            $0.height.equalTo(sectionHeight)
        }
        
        addressView.snp.makeConstraints {
            $0.top.equalTo(updatedAtView.snp.bottom).offset(24)
            $0.leading.trailing.equalTo(safeAreaLayoutGuide).inset(20)
            $0.height.equalTo(sectionHeight)
        }
    }
    
    func setViewContents(vaccinationInfo: VaccinationInfo) {
        centerNameLabel.text = vaccinationInfo.centerName
        facilityNameLabel.text = vaccinationInfo.facilityName
        phoneNumberLabel.text = vaccinationInfo.phoneNumber
        updatedAtLabel.text = vaccinationInfo.updatedAt
        addressLabel.text = vaccinationInfo.address
    }
}
