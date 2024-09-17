//
//  ChangeAppIconView.swift
//  Cluber
//
//  Created by Oliver Park on 9/7/24.
//

import SwiftUI

struct ChangeAppIconView: View {
    let appIcons:[String] = ["AppIcon1","AppIcon2","AppIcon3"]
    @State private var isChanged: Bool = false
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]
    var body: some View {
        NavigationStack {
            ScrollView{
                LazyVGrid(columns: columns, spacing: 0) {
                    ForEach(appIcons,id: \.self) { name in
                        Button {
                            UIApplication.shared.setAlternateIconName(name)
                        } label: {
                            VStack {
                                AppIconImageGridView(image: AppIconFunction(name: name))
                            }
                            .padding()
                        }
                        .alert("App Icon Chaged", isPresented: $isChanged) {
                            Button ("OK", role: .cancel){}
                        }
                    }
                }
            }
            .navigationTitle("Change App Icons")
            .modifier(NavigationBarModifier())
        }
    }
}

#Preview {
    ChangeAppIconView()
}

struct AppIconImageGridView: View {
    var image: String
    var body: some View {
            VStack{
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .clipShape(.rect(cornerRadius: 10))
            }
    }
}

func AppIconFunction(name: String) -> String  {
    if name == "AppIcon1" {
        return "Original"
    } else if name == "AppIcon2" {
        return "Green"
    } else {
        return "Blue"
    }
}
