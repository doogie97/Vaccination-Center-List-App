//
//  VaccinationListCell.swift
//  Vaccination-Center-List-App
//
//  Created by 최최성균 on 2022/09/29.
//

import SnapKit

final class VaccinationListCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let titleFont = UIFont.preferredFont(forTextStyle: .caption1)
    private let infoFont = UIFont.preferredFont(forTextStyle: .footnote)
    private let titleColor = #colorLiteral(red: 0.4233665119, green: 0.4233665119, blue: 0.4233665119, alpha: 1)
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [centerNameStackView,
                                                       facilityNameStackView,
                                                       addsressStackView,
                                                       updateAtStackView])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    //centerName
    private lazy var centerNameStackView = makeInfoStackView(subviews: [centerNameTitleLabel, centerNameLabel])
    private lazy var centerNameTitleLabel = makeLabel(text: "센터명", font: titleFont, color: titleColor)
    private lazy var centerNameLabel = makeLabel(font: infoFont)
    
    //facilityName
    private lazy var facilityNameStackView = makeInfoStackView(subviews: [facilityNameTitleLabel, facilityNameLabel])
    private lazy var facilityNameTitleLabel = makeLabel(text: "건물명", font: titleFont, color: titleColor)
    private lazy var facilityNameLabel = makeLabel(font: infoFont)
    
    //addsress
    private lazy var addsressStackView = makeInfoStackView(subviews: [adsressTitleLabel, addressLabel])
    private lazy var adsressTitleLabel = makeLabel(text: "주소", font: titleFont, color: titleColor)
    private lazy var addressLabel = makeLabel(font: infoFont)
    
    //updateAt
    private lazy var updateAtStackView = makeInfoStackView(subviews: [updateAtTitleLabel, updateAtLabel])
    private lazy var updateAtTitleLabel = makeLabel(text: "업데이트 시간", font: titleFont, color: titleColor)
    private lazy var updateAtLabel = makeLabel(font: infoFont)
    
    private lazy var underLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        
        return view
    }()
    
    private func makeLabel(text: String = "", font: UIFont, color: UIColor = .label) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = font
        label.textColor = color
        
        return label
    }
    
    private func makeInfoStackView(subviews: [UIView]) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: subviews)
        subviews[safe: 0]?.snp.makeConstraints {
            $0.width.equalToSuperview().multipliedBy(0.3)
        }
        
        return stackView
    }
    
    private func setLayout() {
        self.contentView.addSubview(mainStackView)
        self.contentView.addSubview(underLineView)
        
        mainStackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(10)
        }
        
        underLineView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(0.3)
        }
    }
    
    func setCellContents(vaccination: VaccinationInfo) {
        centerNameLabel.text = vaccination.centerName
        facilityNameLabel.text = vaccination.facilityName
        addressLabel.text = vaccination.address
        updateAtLabel.text = vaccination.updatedAt
    }
}
