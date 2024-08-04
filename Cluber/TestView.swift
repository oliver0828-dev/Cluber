

import SwiftUI

struct TestView: View {
    var body: some View {
        VStack {
            LottieView(animationFileName: "jets", loopMode: .loop)
        }
    }
}

#Preview {
    TestView()
}
