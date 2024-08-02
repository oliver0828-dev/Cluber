//
//  CluberApp.swift
//  Cluber
//
//  Created by Oliver Park on 4/23/24.
//

import SwiftUI

@main
struct CluberApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var usernameGrade = UsernameGradeClass()
    @StateObject var photoImage = PhotoPickerViewModel()
    
    var body: some Scene {
        WindowGroup {
            SplashView()
                .environmentObject(usernameGrade)
                .environmentObject(photoImage)
        }
    }
}

