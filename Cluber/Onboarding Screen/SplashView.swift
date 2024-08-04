//
//  SplashView.swift
//  Cluber
//
//  Created by Oliver Park on 8/2/24.
//

import SwiftUI

struct SplashView: View {
    @State private var isLoading = true
    
    var body: some View {
        if isLoading {
            LottieView(animationFileName: "jets", loopMode: .loop)
                .task {
                    try? await Task.sleep(for: .seconds(3))
                    isLoading = false
                }
        } else {
            OnboardingView()
                .preferredColorScheme(.light)
        }
    }
}

#Preview {
    SplashView()
        .environmentObject(UsernameGradeClass())
}
