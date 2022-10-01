//
//  MapViewModel.swift
//  Vaccination-Center-List-App
//
//  Created by 최최성균 on 2022/09/30.
//

import CoreLocation
import RxRelay

protocol MapViewModelable: MapViewModelInput, MapViewModelOutput {}

protocol MapViewModelInput {
    func touchToVaccinationButton()
    func touchToCurrentLocationButton()
}

protocol MapViewModelOutput {
    var centerName: String { get }
    var location: CLLocationCoordinate2D { get }
    var moveToLocation: PublishRelay<CLLocationCoordinate2D> { get }
}

final class MapViewModel: MapViewModelable {
    init(vaccinationInfo: VaccinationInfo) {
        self.centerName = vaccinationInfo.centerName ?? ""
        let latitude = Double(vaccinationInfo.lat ?? "") ?? 0
        let longitude = Double(vaccinationInfo.lng ?? "") ?? 0
        self.location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    //in
    func touchToVaccinationButton() {
        moveToLocation.accept(location)
    }
    
    func touchToCurrentLocationButton() {
        
    }
    
    //output
    let centerName: String
    let location: CLLocationCoordinate2D
    let moveToLocation = PublishRelay<CLLocationCoordinate2D>()
}
