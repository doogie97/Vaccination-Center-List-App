//
//  MainViewModel.swift
//  Vaccination-Center-List-App
//
//  Created by 최최성균 on 2022/09/28.
//

import RxRelay

protocol MainViewModelable: MainViewModelableInput, MainViewModelableOutput {}

protocol MainViewModelableInput {}

protocol MainViewModelableOutput {
    var vaccinations: BehaviorRelay<[VaccinationInfo]> { get }
}

final class MainViewModel: MainViewModelable {
    private let networkManager = NetworkManager()
    private let decoder = DataDecoder()
    
    //out
    let vaccinations = BehaviorRelay<[VaccinationInfo]>(value: [])
}
