//
//  DetailViewController.swift
//  Vaccination-Center-List-App
//
//  Created by 최최성균 on 2022/09/29.
//

import UIKit

final class DetailViewController: UIViewController {
    private let viewModel: DetailViewModelable
    
    init(viewModel: DetailViewModelable) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let detailView = DetailView()
    
    override func loadView() {
        self.view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigation()
    }
    
    private func setNavigation() {
        self.title = viewModel.vaccinationInfo.centerName
        self.navigationItem.rightBarButtonItem = mapButton
    }
    
    private lazy var mapButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.title = "지도"
        
        return button
    }()
}
