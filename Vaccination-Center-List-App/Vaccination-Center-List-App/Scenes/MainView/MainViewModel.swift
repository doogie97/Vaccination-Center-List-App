//
//  MainViewModel.swift
//  Vaccination-Center-List-App
//
//  Created by 최최성균 on 2022/09/28.
//

import RxRelay

protocol MainViewModelable: MainViewModelableInput, MainViewModelableOutput {}

protocol MainViewModelableInput {
    func getVaccinationsInfo()
}

protocol MainViewModelableOutput {
    var vaccinations: BehaviorRelay<[VaccinationInfo]> { get }
}

final class MainViewModel: MainViewModelable {
    private let networkManager = NetworkManager()
    private let decoder = DataDecoder()
    
    func getVaccinationsInfo() {
        let api = VaccinationAPIModel(page: 1, perPage: 10, method: .get)
        networkManager.request(api: api) { [weak self] result in
            switch result {
            case .success(let data):
                do {
                    guard let vaccinations = try self?.decoder.parse(data: data, resultType: VaccinationsResult.self).data else {
                        return
                    }
                    
                    self?.vaccinations.accept(vaccinations)
                } catch {
                    
                }
            case .failure(let error):
                print(error) //추후 에러처리 필요
            }
        }
    }
    //out
    let vaccinations = BehaviorRelay<[VaccinationInfo]>(value: [])
}
