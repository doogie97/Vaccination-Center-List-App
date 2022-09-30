//
//  MapViewModel.swift
//  Vaccination-Center-List-App
//
//  Created by 최최성균 on 2022/09/30.
//

protocol MapViewModelable: MapViewModelInput, MapViewModelOutput {}

protocol MapViewModelInput {}

protocol MapViewModelOutput {}

final class MapViewModel: MapViewModelable {}
final class MapViewModel: MapViewModelable {
    init(vaccinationInfo: VaccinationInfo) {
    }
