//
//  ChangeNameView.swift
//  Cluber
//
//  Created by Oliver Park on 6/14/24.
//

import SwiftUI
import PhotosUI

@MainActor
final class PhotoPickerViewModel: ObservableObject {
    @AppStorage("savedImagePath") private var savedImagePath: String = ""
    @Published private(set) var selectedImage: UIImage? = nil {
        didSet {
            if let selectedImage {
                saveImage(image: selectedImage)
            }
        }
    }
    @Published var imageSelection: PhotosPickerItem? = nil {
        didSet {
            setImage(from: imageSelection)
        }
    }
    
    var isPhoto: Bool {
        selectedImage != nil
    }
    
    init() {
        loadImage()
    }
    
    private func setImage(from selection: PhotosPickerItem?) {
        guard let selection else { return }
        
        Task {
            if let data = try? await selection.loadTransferable(type: Data.self) {
                if let uiImage = UIImage(data: data) {
                    selectedImage = uiImage
                    return
                }
            }
        }
    }
    
    func getDocumentsDirectory() -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    func saveImage(image: UIImage?) {
        guard let image = image else { return }
        if let data = image.jpegData(compressionQuality: 0.8) {
            let filename = getDocumentsDirectory().appendingPathComponent("savedImage.jpg")
            try? data.write(to: filename)
            savedImagePath = filename.path
        }
    }
    
    func loadImage() {
        if !savedImagePath.isEmpty {
            let url = URL(fileURLWithPath: savedImagePath)
            if let data = try? Data(contentsOf: url) {
                selectedImage = UIImage(data: data)
            }
        }
    }
}
struct ChangeProfileView: View {
    @EnvironmentObject var usernameGrade: UsernameGradeClass
    @State var name: String
    @AppStorage ("username") var username: String = ""
    @State var isTapped = false
    
    // Photo Picker
    @StateObject private var photoViewModel = PhotoPickerViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 350, height: 50)
                        .foregroundStyle(.gray.opacity(0.4))
                    
                    TextField("Username", text: $name)
                        .font(.title3.bold())
                        .frame(width: 300, height: 50)
                        .submitLabel(.done)
                        .padding()
                }
                
                
                if let image = photoViewModel.selectedImage {
                    HStack {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                        Text("Your Profile Image")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .fontDesign(.rounded)
                    }
                    .frame(width: 350, height: 160)
                    .background(.gray.opacity(0.4))
                    .clipShape(.rect(cornerRadius: 20))
                }
                
                
                if photoViewModel.isPhoto {
                    PhotosPicker(selection: $photoViewModel.imageSelection, matching: .images) {
                        HStack {
                            Image(systemName: "pencil")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                            Text("Edit Your Profile Image")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .fontDesign(.rounded)
                        }
                    }
                } else {
                    PhotosPicker(selection: $photoViewModel.imageSelection, matching: .images) {
                        HStack {
                            Image(systemName: "person.crop.circle.badge.plus")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                            Text("Add Your Profile Image")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .fontDesign(.rounded)
                        }
                    }
                    
                }
                
                Button {
                    usernameGrade.userName = name
                    isTapped.toggle()
                    UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                } label: {
                    Text("SAVE")
                        .foregroundStyle(.white)
                        .frame(width: 120, height: 50)
                        .background(.blue)
                        .clipShape(.rect(cornerRadius: 20))
                }
                .alert(isPresented: $isTapped) {
                    if let _ = photoViewModel.selectedImage {
                        return Alert(title: Text("New Name: \(usernameGrade.userName)"), message: Text("Profile image has been saved"), dismissButton: .default(Text("Done")))
                    } else {
                        return Alert(title: Text("New Name: \(usernameGrade.userName)"), dismissButton: .default(Text("Done")))
                    }
                }
            }
            
            Spacer()
                .navigationTitle("Change Profile")
        }.modifier(NavigationBarModifier())
                
    }
}

#Preview {
    ChangeProfileView(name: "Oliver")
        .environmentObject(UsernameGradeClass())
}
