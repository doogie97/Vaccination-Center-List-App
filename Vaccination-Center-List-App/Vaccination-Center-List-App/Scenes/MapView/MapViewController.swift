//
//  MapViewController.swift
//  Vaccination-Center-List-App
//
//  Created by 최최성균 on 2022/09/30.
//

import RxSwift
import CoreLocation

final class MapViewController: UIViewController {
    private let viewModel: MapViewModelable
    
    init(viewModel: MapViewModelable) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let mapView = MapView()
    private let diseposeBag = DisposeBag()
    private let locationManager = CLLocationManager()
    
    override func loadView() {
        self.view = mapView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigation()
        bindView()
        mapView.setLocationPin(location: viewModel.location, title: viewModel.centerName)
        mapView.moveLoaction(location: viewModel.location)
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    private func bindView() {
        mapView.toVaccinationButton.rx.tap
            .withUnretained(self)
            .bind(onNext: { owner, _ in
                owner.viewModel.touchToVaccinationButton()
            })
            .disposed(by: diseposeBag)
        
        mapView.toCurrentLocationButton.rx.tap
            .withUnretained(self)
            .bind(onNext: { owner, _ in
                owner.viewModel.touchToCurrentLocationButton()
            })
            .disposed(by: diseposeBag)
        
        viewModel.moveToLocation
            .withUnretained(self)
            .bind(onNext: {owner, location in
                owner.mapView.moveLoaction(location: location)
            })
            .disposed(by: diseposeBag)
    }
    
    private func setNavigation() {
        self.title = "지도"
        self.navigationItem.leftBarButtonItem?.title = "Back"
    }
}

extension MapViewController: CLLocationManagerDelegate {
}
