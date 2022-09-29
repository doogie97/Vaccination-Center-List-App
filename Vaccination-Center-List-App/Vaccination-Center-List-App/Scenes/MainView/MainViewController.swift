//
//  MainViewController.swift
//  Vaccination-Center-List-App
//
//  Created by 최최성균 on 2022/09/27.
//

import UIKit

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
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "예방접종센터 리스트"
        navigationController?.navigationBar.setBackgroundColor(color: .systemGray6)
    }
    
}
