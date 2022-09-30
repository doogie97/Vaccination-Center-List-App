//
//  MainView.swift
//  Vaccination-Center-List-App
//
//  Created by 최최성균 on 2022/09/28.
//

import SnapKit

final class MainView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private(set) lazy var listCollectionView: UICollectionView = {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.3))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: itemSize.widthDimension, heightDimension: itemSize.heightDimension)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
        
        let section = NSCollectionLayoutSection(group: group)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

        collectionView.register(VaccinationListCell.self, forCellWithReuseIdentifier: "\(VaccinationListCell.self)")
        
        collectionView.backgroundColor = .systemBackground
        
        return collectionView
    }()
    
    private let buttonHeight = UIScreen.main.bounds.width / 9
    
    private(set) lazy var scrollToTopButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBackground
        button.setImage(UIImage(named:"top-alignment"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
        button.layer.cornerRadius = CGFloat(buttonHeight / 2)
        button.setShadow(offset: .zero, width: buttonHeight, height: buttonHeight)
        
        return button
    }()
    
    private func setLayout() {
        self.backgroundColor = .systemBackground
        self.addSubview(listCollectionView)
        self.addSubview(scrollToTopButton)

        listCollectionView.snp.makeConstraints {
            $0.edges.equalTo(safeAreaLayoutGuide)
        }
        
        scrollToTopButton.snp.makeConstraints {
            $0.height.width.equalTo(buttonHeight)
            $0.trailing.equalToSuperview().inset(40)
            $0.bottom.equalToSuperview().inset(60)
        }
    }
}
