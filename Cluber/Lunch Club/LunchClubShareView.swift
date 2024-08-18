//
//  LunchClubShareView.swift
//  Cluber
//
//  Created by Oliver Park on 6/15/24.
//

import SwiftUI

struct LunchClubShareView: View {
    @EnvironmentObject var usernameGrade: UsernameGradeClass
    @Environment(\.colorScheme) var colorScheme
    @State private var highSchoolLunchClubList: [LunchClubStruct] = LunchClubList.HighSchool
    @State private var elementarySchoolLunchClubList: [LunchClubStruct] = LunchClubList.ElementarySchool
    @State private var middleSchoolLunchClubList: [LunchClubStruct] = LunchClubList.MiddleSchool
    
    @State private var image: UIImage?
    
    var body: some View {
        GeometryReader { _ in
            VStack(alignment: .center) {
                Text("These are my Lunch Clubs!")
                    .font(.title)
                    .fontWeight(.medium)
                    .foregroundStyle(.black)
                    .padding()
                
                Section {
                    VStack (alignment: .leading){
                        ForEach(1...5, id: \.self) { day in
                            Section(header:
                                        Text(dayOfWeekString(from: day))
                                .font(.title)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                            ) {
                                switch usernameGrade.schoolGrade {
                                case "Elementary":
                                    VStack (alignment: .leading){
                                        ForEach(elementarySchoolLunchClubList.indices, id: \.self) { index in
                                            let elementarySchoolLunchClub = elementarySchoolLunchClubList[index]
                                            if elementarySchoolLunchClub.dayOfWeek == day && elementarySchoolLunchClub.isMember {
                                                Text(elementarySchoolLunchClub.clubName)
                                                    .padding()
                                            }
                                        }
                                    }
                                case "Middle":
                                    VStack(alignment: .leading) {
                                        ForEach(middleSchoolLunchClubList.indices, id: \.self) { index in
                                            let middleSchoolLunchClub = middleSchoolLunchClubList[index]
                                            if middleSchoolLunchClub.dayOfWeek == day && middleSchoolLunchClub.isMember {
                                                Text(middleSchoolLunchClub.clubName)
                                                    .padding()
                                            }
                                        }
                                    }
                                case "High":
                                    VStack (alignment: .leading){
                                        ForEach(highSchoolLunchClubList.indices, id: \.self) { index in
                                            let highSchoolLunchClub = highSchoolLunchClubList[index]
                                            if highSchoolLunchClub.dayOfWeek == day && highSchoolLunchClub.isMember {
                                                Text(highSchoolLunchClub.clubName)
                                                    .padding()
                                            }
                                        }
                                    }
                                default:
                                    Text("Choose Your Lunch Club")
                                }
                            }
                        }
                    }
                    .foregroundStyle(.black)
                }
                .listStyle(GroupedListStyle())
                
                Spacer()
                Button {
                    image = takeCapture()
                } label: {
                    Text("Capture")
                }
                if let image {
                    Button {
                        instagramShare(image: image)
                    } label: {
                        HStack {
                            Image("instagram")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                            Text("Instagram Stories")
                                .foregroundStyle(.white)
                        }
                        .frame(width: 200, height: 50)
                        .background(.black.gradient)
                        .clipShape(.rect(cornerRadius: 15))
                    }
                }
                
                
                Text(usernameGrade.schoolGrade + " School")
                Text("Cluber")
                    .font(.title2)
                    .fontWeight(.bold)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(CircleColor(gradeLevel: usernameGrade.schoolGrade, colorScheme: .light))
            
        }
    }
    
    func dayOfWeekString(from day: Int) -> String {
        switch day {
        case 1:
            return "Monday"
        case 2:
            return "Tuesday"
        case 3:
            return "Wednesday"
        case 4:
            return "Thursday"
        case 5:
            return "Friday"
        default:
            return "Unknown Day"
        }
    }
    
    func takeCapture() -> UIImage {
        var image: UIImage?
        guard let currentLayer = UIApplication.shared.windows.first { $0.isKeyWindow }?.layer else { return UIImage() }
        
        let currentScale = UIScreen.main.scale
        
        UIGraphicsBeginImageContextWithOptions(currentLayer.frame.size, false, currentScale)
        
        guard let currentContext = UIGraphicsGetCurrentContext() else { return UIImage() }
        
        currentLayer.render(in: currentContext)
        
        image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return image ?? UIImage()
    }
    
    func instagramShare(image: UIImage) {
        if let urlScheme = URL(string: "instagram-stories://share") {
            if UIApplication.shared.canOpenURL(urlScheme) {
                let pasteboardItems = [
                    [
                        "com.instagram.sharedSticker.stickerImage": image.pngData(),
                        "com.instagram.sharedSticker.backgroundImage": image.pngData()
                    ]
                ]
                
                let pasteboardOptions = [UIPasteboard.OptionsKey.expirationDate: Date().addingTimeInterval(60 * 5)]
                
                UIPasteboard.general.setItems(pasteboardItems, options: pasteboardOptions)
                
                UIApplication.shared.open(urlScheme as URL, options: [:], completionHandler: nil)
            } else {
                print("인스타 앱이 깔려있지 않습니다.")
            }
        }
    }
}

struct Photo: Transferable {
    public var image: Image
    
    static var transferRepresentation: some TransferRepresentation {
        ProxyRepresentation(exporting: \.image)
    }
}

#Preview {
    LunchClubShareView()
        .environmentObject(UsernameGradeClass())
}
