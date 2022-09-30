//
//  MapViewController.swift
//  Vaccination-Center-List-App
//
//  Created by 최최성균 on 2022/09/30.
//

import UIKit

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
    
    override func loadView() {
        self.view = mapView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigation()
        mapView.setLocationPin(location: viewModel.location, title: viewModel.centerName)
        mapView.moveLoaction(location: viewModel.location)
    }
    
    private func setNavigation() {
        self.title = "지도"
        self.navigationItem.leftBarButtonItem?.title = "Back"
    }
}
