//
//  DetailViewModel.swift
//  Vaccination-Center-List-App
//
//  Created by 최최성균 on 2022/09/29.
//

protocol DetailViewModelable: DetailViewModelInput, DetailViewModelOutput {}

protocol DetailViewModelInput {}

protocol DetailViewModelOutput {}

final class DetailViewModel: DetailViewModelable {}
