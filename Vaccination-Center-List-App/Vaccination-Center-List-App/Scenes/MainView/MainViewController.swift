//
//  MainViewController.swift
//  Vaccination-Center-List-App
//
//  Created by 최최성균 on 2022/09/27.
//

import UIKit

final class MainViewController: UIViewController {
    private let mainView = MainView()
    
    override func loadView() {
        self.view = mainView
    }
}

