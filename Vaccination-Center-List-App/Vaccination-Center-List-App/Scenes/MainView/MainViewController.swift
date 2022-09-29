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
    private let container: Container
    
    init(viewModel: MainViewModelable, container: Container) {
        self.viewModel = viewModel
        self.container = container
        
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
        setNavigation()
        bindView()
        mainView.listCollectionView.refreshControl = refreshController
    }
    
    private func setNavigation() {
        self.title = "예방접종센터 리스트"
        self.navigationController?.navigationBar.setBackgroundColor(color: .systemGray6)
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    private func bindView() {
        viewModel.vaccinations.bind(to: mainView.listCollectionView.rx.items(cellIdentifier: "\(VaccinationListCell.self)", cellType: VaccinationListCell.self)){ index, vaccination, cell in
            cell.setCellContents(vaccination: vaccination)
        }
            .disposed(by: disposeBag)
        
        mainView.listCollectionView.rx.itemSelected
            .withUnretained(self)
            .bind(onNext: { owner, indexPath in
                owner.viewModel.touchCell(indexPath.row)
            })
            .disposed(by: disposeBag)
        
        mainView.listCollectionView.rx.prefetchItems
            .withUnretained(self)
            .bind(onNext: { owner, indexPath in
                let listCount = owner.viewModel.vaccinations.value.count
                
                if indexPath.last?.row == listCount - 1 {
                    owner.viewModel.scrolledEndPoint()
                }
            })
            .disposed(by: disposeBag)
        
        refreshController.rx.controlEvent(.valueChanged)
            .withUnretained(self)
            .bind(onNext: { owner, _ in
                owner.viewModel.reloadCollectionView()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    owner.mainView.listCollectionView.refreshControl?.endRefreshing()
                    owner.mainView.listCollectionView.setContentOffset(.zero, animated: true)
                }
            })
            .disposed(by: disposeBag)
        
        viewModel.showDetailView
            .withUnretained(self)
            .bind(onNext: { owner, vaccinationInfo in
                let detailVC = owner.container.detailViewController()
                
                owner.navigationController?.pushViewController(detailVC, animated: true)
            })
            .disposed(by: disposeBag)
    }
}
