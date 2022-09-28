//
//  MainViewModel.swift
//  Vaccination-Center-List-App
//
//  Created by 최최성균 on 2022/09/28.
//

protocol MainViewModelable: MainViewModelableInput, MainViewModelableOutput {}

protocol MainViewModelableInput {}

protocol MainViewModelableOutput {}

final class MainViewModel: MainViewModelable {
    private let networkManager = NetworkManager()
    private let decoder = DataDecoder()
    
}
