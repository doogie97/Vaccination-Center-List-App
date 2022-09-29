//
//  MainViewController.swift
//  Vaccination-Center-List-App
//
//  Created by 최최성균 on 2022/09/27.
//

import RxSwift
import RxCocoa

final class MainViewController: UIViewController {
    private let viewModel: MainViewModelable
    
    init(viewModel: MainViewModelable) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let mainView = MainView()
    private let refreshController = UIRefreshControl()
    private let disposeBag = DisposeBag()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
        title = "예방접종센터 리스트"
        navigationController?.navigationBar.setBackgroundColor(color: .systemGray6)
        
        mainView.listCollectionView.refreshControl = refreshController
        bindView()
    }
    
    private func bindView() {
        viewModel.vaccinations.bind(to: mainView.listCollectionView.rx.items(cellIdentifier: "\(VaccinationListCell.self)", cellType: VaccinationListCell.self)){ index, vaccination, cell in
            cell.setCellContents(vaccination: vaccination)
        }
            .disposed(by: disposeBag)
        
        mainView.listCollectionView.rx.prefetchItems
            .bind(onNext: { [weak self] in
                guard let listCount = self?.viewModel.vaccinations.value.count else {
                    return
                }
                
                if $0.last?.row == listCount - 1 {
                    self?.viewModel.scrolledEndPoint()
                }
            })
            .disposed(by: disposeBag)
    }
}
