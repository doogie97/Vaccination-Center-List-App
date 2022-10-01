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
    func touchToCurrentLocationButton(_ authorization: CLAuthorizationStatus)
}

protocol MapViewModelOutput {
    var centerName: String { get }
    var location: CLLocationCoordinate2D { get }
    var moveToLocation: PublishRelay<CLLocationCoordinate2D> { get }
    var requestAuthorization: PublishRelay<Void> { get }
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
    
    func touchToCurrentLocationButton(_ authorization: CLAuthorizationStatus) {
        switch authorization {
        case .notDetermined:
            requestAuthorization.accept(())
        case .restricted, .denied:
            print("권한 허용해달라고 얼럿 띄우기")
        case .authorizedAlways, .authorizedWhenInUse:
            print("위치 요청하기")
        default:
            print("알수없는오류 띄우기")
        }
    }
    
    //output
    let centerName: String
    let location: CLLocationCoordinate2D
    let moveToLocation = PublishRelay<CLLocationCoordinate2D>()
    let requestAuthorization = PublishRelay<Void>()
}
