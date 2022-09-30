//
//  MapView.swift
//  Vaccination-Center-List-App
//
//  Created by 최최성균 on 2022/09/30.
//

import SnapKit
import MapKit

final class MapView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        
        return mapView
    }()
    
    private(set) lazy var toCurrentLocationButton: UIButton = {
        let button = UIButton()
        button.setTitle("현재위치로", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5
        button.snp.makeConstraints {
            $0.height.equalTo(UIScreen.main.bounds.width * 0.12)
        }
        
        return button
    }()
    
    private(set) lazy var toVaccinationButton: UIButton = {
        let button = UIButton()
        button.setTitle("접종센터로", for: .normal)
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 5
        button.snp.makeConstraints {
            $0.height.equalTo(UIScreen.main.bounds.width * 0.12)
        }
        
        return button
    }()
    
    private func setLayout() {
        self.addSubview(mapView)
        self.addSubview(toCurrentLocationButton)
        self.addSubview(toVaccinationButton)
        
        mapView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }
        
        toCurrentLocationButton.snp.makeConstraints {
            $0.leading.trailing.equalTo(safeAreaLayoutGuide).inset(16)
            $0.bottom.equalTo(toVaccinationButton.snp.top).inset(-8)
        }
        
        toVaccinationButton.snp.makeConstraints {
            $0.leading.trailing.equalTo(safeAreaLayoutGuide).inset(16)
            $0.bottom.equalTo(safeAreaLayoutGuide).inset(32)
        }
    }
    
    func setLocationPin(location: CLLocationCoordinate2D, title: String) {
        let pin = MKPointAnnotation()
        pin.coordinate = location
        pin.title = title
        
        mapView.addAnnotation(pin)
    }
    
    func moveLoaction(location: CLLocationCoordinate2D) {
        let region = MKCoordinateRegion(center: location,
                                        span: MKCoordinateSpan(latitudeDelta:0.01, longitudeDelta:0.01))
        mapView.setRegion(region, animated: true)
    }
}
