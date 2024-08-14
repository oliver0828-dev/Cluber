//
//  AccountView.swift
//  Cluber
//
//  Created by Oliver Park on 5/20/24.
//

import SwiftUI
import PhotosUI
import UIKit

struct SettingsView: View {
    @EnvironmentObject var usernameGrade: UsernameGradeClass
    @EnvironmentObject var photoImage: PhotoPickerViewModel
    
    let username: String
    @State var gradeLevel = "Elementary"
    let grade: [String] = ["Elementary", "Middle", "High"]
    
    @AppStorage("gradeInt") var gradeInt: Int = 1
    
    var body: some View {
        VStack(alignment: .leading) {
                Text("Setting")
                    .font(.title)
                    .padding()
                List {
                    Section("Your Profile") {
                        HStack {
                            if let image = photoImage.selectedImage {
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFit()
                                    .clipShape(Circle())
                                    .frame(width: 150, height: 100)
                            } else {
                                Image(systemName: "person.crop.circle.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                            }
                            VStack (alignment: .leading) {
                                Text(usernameGrade.userName)
                                    .font(.title3.bold())
                                Text(usernameGrade.schoolGrade + " School")
                                    .foregroundStyle(.secondary)
                                Text(gradeYear(year: usernameGrade.gradeNumber))
                                    .foregroundStyle(.secondary)
                            }
                            .fontDesign(.rounded)
                            .padding()
                        }
                    }
                    
                    Section ("Edit Your Profile") {
                        NavigationLink {
                            ChangeGradeSettingsView(gradeLevel: gradeLevel, gradeInt: gradeInt)
                        } label: {
                            HStack {
                                Image(systemName: "\(gradeInt).square.fill")
                                    .fontWeight(.semibold)
                                Text("Change Grade")
                                    .fontDesign(.rounded)
                            }
                        }
                        
                        Section {
                            NavigationLink {
                                ChangeProfileView(name: username)
                                    .environmentObject(photoImage)
                            } label: {
                                HStack {
                                    Image(systemName: "person.circle.fill")
                                        .fontWeight(.semibold)
                                    Text("Change Profile")
                                        .fontDesign(.rounded)
                                }
                            }
                        }
                    }
                    
                    Section ("Check for Updates") {
                        HStack {
                            Image(systemName: "doc.plaintext.fill")
                            Link("Update Notes", destination: URL(string: "https://ollie-dev.notion.site/Cluber-eb40f2c0f3f14d66a5c47165fda28ad9?pvs=4")!)
                                .foregroundStyle(.primary)
                                .fontDesign(.rounded)
                        }
                    }
                }
            }
        .modifier(NavigationBarModifier())
    }
}

#Preview {
    SettingsView(username: "Oliver")
        .environmentObject(UsernameGradeClass())
        .environmentObject(PhotoPickerViewModel())
}

struct NavigationBarModifier: ViewModifier {
    init() {
        let design = UIFontDescriptor.SystemDesign.rounded

        let baseDescriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: .largeTitle).withDesign(design)!
        
        let boldDescriptor = baseDescriptor.withSymbolicTraits(.traitBold) ?? baseDescriptor
        
        let largeFont = UIFont(descriptor: boldDescriptor, size: 35)
        UINavigationBar.appearance().largeTitleTextAttributes = [.font: largeFont]
        
        let font = UIFont(descriptor: boldDescriptor, size: 16)
        UINavigationBar.appearance().titleTextAttributes = [.font: font]
    }

    func body(content: Content) -> some View {
        content
    }
}
