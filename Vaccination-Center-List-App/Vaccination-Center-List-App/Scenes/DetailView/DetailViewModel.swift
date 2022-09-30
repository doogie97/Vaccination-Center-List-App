//
//  DetailViewModel.swift
//  Vaccination-Center-List-App
//
//  Created by 최최성균 on 2022/09/29.
//

import RxRelay

protocol DetailViewModelable: DetailViewModelInput, DetailViewModelOutput {}

protocol DetailViewModelInput {
    func touchMapButton()
}

protocol DetailViewModelOutput {
    var vaccinationInfo: VaccinationInfo { get }
    var showMapView: PublishRelay<VaccinationInfo> { get }
}

final class DetailViewModel: DetailViewModelable {
    init(vaccinationInfo: VaccinationInfo) {
        self.vaccinationInfo = vaccinationInfo
    }
    
    //in
    func touchMapButton() {
        showMapView.accept(vaccinationInfo)
    }
    
    //out
    let vaccinationInfo: VaccinationInfo
    let showMapView = PublishRelay<VaccinationInfo>()
}
