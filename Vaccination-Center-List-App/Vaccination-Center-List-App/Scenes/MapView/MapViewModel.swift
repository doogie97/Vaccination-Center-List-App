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
    func receiveCurrentLocation(_ location: CLLocation?)
}

protocol MapViewModelOutput {
    var centerName: String { get }
    var location: CLLocationCoordinate2D { get }
    var moveToLocation: PublishRelay<CLLocationCoordinate2D> { get }
    var requestAuthorization: PublishRelay<Void> { get }
    var requestLocation: PublishRelay<Void> { get }
    var showBasicAlert: PublishRelay<String> { get }
    var showSettingAlert: PublishRelay<(title: String, messege: String)> { get }
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
            showSettingAlert.accept((title: "위치 권한 요청", messege: "현재 위치를 사용하기 위해 위치 권한이 필요합니다"))
        case .authorizedAlways, .authorizedWhenInUse:
            requestLocation.accept(())
        default:
            showBasicAlert.accept("알 수 없는 오류 발생")
        }
    }
    
    func receiveCurrentLocation(_ location: CLLocation?) {
        guard let location = location else {
            return
        }

        moveToLocation.accept(CLLocationCoordinate2D(latitude: location.coordinate.latitude,
                                                     longitude: location.coordinate.longitude))
    }
    
    //output
    let centerName: String
    let location: CLLocationCoordinate2D
    let moveToLocation = PublishRelay<CLLocationCoordinate2D>()
    let requestAuthorization = PublishRelay<Void>()
    let requestLocation = PublishRelay<Void>()
    let showBasicAlert = PublishRelay<String>()
    let showSettingAlert = PublishRelay<(title: String, messege: String)>()
}
