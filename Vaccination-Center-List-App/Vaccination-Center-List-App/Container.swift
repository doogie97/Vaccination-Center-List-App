//
//  Container.swift
//  Vaccination-Center-List-App
//
//  Created by 최최성균 on 2022/09/28.
//

final class Container {
    func mainViewController() -> MainViewController {
        return MainViewController(viewModel: mainViewModel())
    }
    
    private func mainViewModel() -> MainViewModelable {
        return MainViewModel()
    }
    
    func detailViewController() -> DetailViewController {
        return DetailViewController(viewModel: detailViewModel())
    }
    
    private func detailViewModel() -> DetailViewModelable {
        return DetailViewModel()
    }
}
