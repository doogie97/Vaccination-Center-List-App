//
//  MainViewModel.swift
//  Vaccination-Center-List-App
//
//  Created by 최최성균 on 2022/09/28.
//

import RxRelay

protocol MainViewModelable: MainViewModelableInput, MainViewModelableOutput {}

protocol MainViewModelableInput {
    func viewDidLoad()
    func touchCell(_ index: Int)
    func scrolledEndPoint()
    func reloadCollectionView()
}

protocol MainViewModelableOutput {
    var vaccinations: BehaviorRelay<[VaccinationInfo]> { get }
    var showDetailView: PublishRelay<VaccinationInfo> { get }
}

final class MainViewModel: MainViewModelable {
    private let networkManager = NetworkManager()
    private let decoder = DataDecoder()
    private var page = 1
    private let perPage = 10
    
    //in
    func viewDidLoad() {
        getVaccinationsInfo()
    }
    
    func touchCell(_ index: Int) {
        guard let vaccnationInfo = vaccinations.value[safe: index] else {
            return
        }
        
        showDetailView.accept(vaccnationInfo)
    }
    
    func scrolledEndPoint() {
        page += 1
        getVaccinationsInfo()
    }
    
    func reloadCollectionView() {
        page = 1
        vaccinations.accept([])
        getVaccinationsInfo()
    }
    
    //out
    let vaccinations = BehaviorRelay<[VaccinationInfo]>(value: [])
    let showDetailView = PublishRelay<VaccinationInfo>()
}

extension MainViewModel {
    private func getVaccinationsInfo() {
        let api = VaccinationAPIModel(page: page, perPage: perPage, method: .get)
        networkManager.request(api: api) { [weak self] result in
            switch result {
            case .success(let data):
                do {
                    guard let vaccinations = try self?.decoder.parse(data: data, resultType: VaccinationsResult.self).vaccinations else {
                        return
                    }
                    
                    let oldVaccinations = self?.vaccinations.value ?? []
                    let newVaccinations = oldVaccinations + vaccinations.sorted {
                        ($0.updatedAt ?? "").toDate > ($1.updatedAt ?? "").toDate
                    }
                    
                    self?.vaccinations.accept(newVaccinations)
                } catch let error{
                    print(error) //추후 에러처리 필요
                }
            case .failure(let error):
                print(error) //추후 에러처리 필요
            }
        }
    }
}
