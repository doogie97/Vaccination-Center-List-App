//
//  DetailViewController.swift
//  Vaccination-Center-List-App
//
//  Created by 최최성균 on 2022/09/29.
//

import RxSwift

final class DetailViewController: UIViewController {
    private let viewModel: DetailViewModelable
    private let container: Container
    
    init(viewModel: DetailViewModelable, container: Container) {
        self.viewModel = viewModel
        self.container = container
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let detailView = DetailView()
    private let disposeBag = DisposeBag()
    
    override func loadView() {
        self.view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigation()
        detailView.setViewContents(vaccinationInfo: viewModel.vaccinationInfo)
        bindView()
    }
    
    private func setNavigation() {
        self.title = viewModel.vaccinationInfo.centerName
        self.navigationItem.rightBarButtonItem = mapButton
    }
    
    private func bindView() {
        
        viewModel.showMapView
            .withUnretained(self)
            .bind { owner, _ in
                let mapVC = owner.container.mapViewController()
                
                owner.navigationController?.pushViewController(mapVC, animated: true)
            }
            .disposed(by: disposeBag)
    }
    
    private lazy var mapButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.title = "지도"
        
        return button
    }()
}
