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
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [centerNameStackView,
                                                       facilityNameStackView,
                                                       addsressStackView,
                                                       updateAtStackView])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    private lazy var centerNameStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [centerNameTitleLabel, centerNameLabel])
        centerNameTitleLabel.snp.makeConstraints {
            $0.width.equalToSuperview().multipliedBy(0.3)
        }
        
        return stackView
    }()
    
    private lazy var centerNameTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        label.textColor = #colorLiteral(red: 0.4233665119, green: 0.4233665119, blue: 0.4233665119, alpha: 1)
        label.text = "센터명"
        
        return label
    }()
    
    private lazy var centerNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .footnote)
        
        return label
    }()
    
    
    private lazy var facilityNameStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [facilityNameTitleLabel, facilityNameLabel])
        facilityNameTitleLabel.snp.makeConstraints {
            $0.width.equalToSuperview().multipliedBy(0.3)
        }
        
        return stackView
    }()
    
    private lazy var facilityNameTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        label.textColor = #colorLiteral(red: 0.4233665119, green: 0.4233665119, blue: 0.4233665119, alpha: 1)
        label.text = "건물명"
        
        return label
    }()
    
    private lazy var facilityNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .footnote)
        
        return label
    }()
    
    private lazy var addsressStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [adsressTitleLabel, addressLabel])
        adsressTitleLabel.snp.makeConstraints {
            $0.width.equalToSuperview().multipliedBy(0.3)
        }
        
        return stackView
    }()
    
    private lazy var adsressTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        label.textColor = #colorLiteral(red: 0.4233665119, green: 0.4233665119, blue: 0.4233665119, alpha: 1)
        label.text = "주소"
        
        return label
    }()
    
    private lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .footnote)
        
        return label
    }()
    
    private lazy var updateAtStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [updateAtTitleLabel, updateAtLabel])
        updateAtTitleLabel.snp.makeConstraints {
            $0.width.equalToSuperview().multipliedBy(0.3)
        }
        
        return stackView
    }()
    
    private lazy var updateAtTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        label.textColor = #colorLiteral(red: 0.4233665119, green: 0.4233665119, blue: 0.4233665119, alpha: 1)
        label.text = "업데이트 시간"
        
        return label
    }()
    
    private lazy var updateAtLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .footnote)
        
        return label
    }()
    
    private lazy var underLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        
        return view
    }()
    
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
