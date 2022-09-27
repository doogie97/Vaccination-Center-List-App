//
//  SceneDelegate.swift
//  Vaccination-Center-List-App
//
//  Created by 최최성균 on 2022/09/27.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let mainVC = ViewController()
        let navigationController = UINavigationController(rootViewController: mainVC)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

