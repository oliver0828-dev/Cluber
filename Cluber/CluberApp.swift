//
//  CluberApp.swift
//  Cluber
//
//  Created by Oliver Park on 4/23/24.
//

import SwiftUI
import FacebookCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        let sceneConfig = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
        
        sceneConfig.delegateClass = SceneDelegate.self
        
        return sceneConfig
    }
}

class SceneDelegate: NSObject, UIWindowSceneDelegate {
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        guard let url = URLContexts.first?.url else {
            return
        }
        
        ApplicationDelegate.shared.application(
            UIApplication.shared,
            open: url,
            sourceApplication: nil,
            annotation: [UIApplication.OpenURLOptionsKey.annotation]
        )
    }
}

@main
struct CluberApp: App {
    @UIApplicationDelegateAdaptor var delegate: AppDelegate
    
    @StateObject var usernameGrade = UsernameGradeClass()
    @StateObject var photoImage = PhotoPickerViewModel()
    
    var body: some Scene {
        WindowGroup {
            OnboardingView()
                .preferredColorScheme(.light)
                .environmentObject(usernameGrade)
                .environmentObject(photoImage)
        }
    }
}

