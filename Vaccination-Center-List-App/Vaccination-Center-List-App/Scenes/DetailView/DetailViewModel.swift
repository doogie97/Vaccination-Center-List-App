//
//  DetailViewModel.swift
//  Vaccination-Center-List-App
//
//  Created by 최최성균 on 2022/09/29.
//

protocol DetailViewModelable: DetailViewModelInput, DetailViewModelOutput {}

protocol DetailViewModelInput {}

protocol DetailViewModelOutput {
    var vaccinationInfo: VaccinationInfo { get }
}

final class DetailViewModel: DetailViewModelable {
    init(vaccinationInfo: VaccinationInfo) {
        self.vaccinationInfo = vaccinationInfo
    }
    
    //out
    let vaccinationInfo: VaccinationInfo
}
