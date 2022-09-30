//
//  Container.swift
//  Vaccination-Center-List-App
//
//  Created by 최최성균 on 2022/09/28.
//

final class Container {
    func mainViewController() -> MainViewController {
        return MainViewController(viewModel: mainViewModel(), container: self)
    }
    
    private func mainViewModel() -> MainViewModelable {
        return MainViewModel()
    }
    
    func detailViewController(vaccinationInfo: VaccinationInfo) -> DetailViewController {
        return DetailViewController(viewModel: detailViewModel(vaccinationInfo: vaccinationInfo))
    }
    
    private func detailViewModel(vaccinationInfo: VaccinationInfo) -> DetailViewModelable {
        return DetailViewModel(vaccinationInfo: vaccinationInfo)
    }
    
    func mapViewController() -> MapViewController {
        return MapViewController(viewModel: mapViewModel())
    }
    
    private func mapViewModel() -> MapViewModelable {
        return MapViewModel()
    }
}
