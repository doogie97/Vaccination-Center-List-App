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
    private var page = 1
    private let perPage = 10
    
    func getVaccinationsInfo() {
        let api = VaccinationAPIModel(page: page, perPage: perPage, method: .get)
        networkManager.request(api: api) { [weak self] result in
            switch result {
            case .success(let data):
                do {
                    guard let vaccinations = try self?.decoder.parse(data: data, resultType: VaccinationsResult.self).vaccinations else {
                        return
                    }
                    
                    self?.vaccinations.accept(vaccinations.sorted {
                        ($0.updatedAt ?? "").toDate > ($1.updatedAt ?? "").toDate
                    })
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
