//
//  SceneDelegate.swift
//  GitHubFinder
//
//  Created by Saul Goodman on 07.12.2020.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        
        let initialController = BaseNavigationController()
        initialController.setRootWireframe(HomeWireframe())
        
        window = UIWindow(windowScene: scene)
        
        window?.rootViewController = initialController
        window?.makeKeyAndVisible()
    }
}
