

import SwiftUI

struct TestView: View {
    @State private var showingScrolledTitle = false
    
    private func scrollDetector(topInsets: CGFloat) -> some View {
        GeometryReader { proxy in
            let minY = proxy.frame(in: .global).minY
            let isUnderToolbar = minY - topInsets < 0
            Color.clear
                .onChange(of: isUnderToolbar) { _, newVal in
                    showingScrolledTitle = newVal
                }
        }
    }
    
    var body: some View {
        GeometryReader { outer in
            NavigationStack {
                List {
                    Section {
                        ForEach(1...5, id: \.self) { val in
                            NavigationLink("List item \(val)") {
                                Text("List item \(val)")
                            }
                        }
                    } header: {
                        Text("Today")
                            .font(.custom("Chalkboard SE", size: 36))
                            .textCase(nil)
                            .bold()
                            .listRowInsets(.init(top: 4, leading: 0, bottom: 8, trailing: 0))
                            .background {
                                scrollDetector(topInsets: outer.safeAreaInsets.top)
                            }
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Image(systemName: "gearshape.fill")
                    }
                    ToolbarItem(placement: .principal) {
                        Text("Today")
                            .font(.custom("Chalkboard SE", size: 18))
                            .bold()
                            .opacity(showingScrolledTitle ? 1 : 0)
                            .animation(.easeInOut, value: showingScrolledTitle)
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Image(systemName: "calendar")
                            .padding(.trailing, 20)
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Image(systemName: "plus.circle.fill")
                    }
                }
                .navigationTitle("Today")
                .navigationBarTitleDisplayMode(.inline)
                .scrollContentBackground(.hidden)
                .foregroundStyle(.indigo)
                .background(.indigo.opacity(0.1))
                .toolbarBackground(.indigo.opacity(0.1))
            }
        }
    }
}

#Preview {
    TestView()
}
