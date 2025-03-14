//
//  LunchClubShareView.swift
//  Cluber
//
//  Created by Oliver Park on 6/15/24.
//

import SwiftUI

struct IGShareView: View {
    @EnvironmentObject var usernameGrade: UsernameGradeClass
    @Environment(\.colorScheme) var colorScheme
    
    @State private var highSchoolLunchClubList: [LunchClubStruct] = LunchClubList.HighSchool
    @State private var elementarySchoolLunchClubList: [LunchClubStruct] = LunchClubList.ElementarySchool
    @State private var middleSchoolLunchClubList: [LunchClubStruct] = LunchClubList.MiddleSchool
    @State private var clubCount = 0
    @State private var image: UIImage?
    @State private var inInstagram = false
    
    var body: some View {
        ViewThatFits {
            GeometryReader { geometry in
                ZStack {
                    Image("igShareImage")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width)
                        .ignoresSafeArea()
                    
                    VStack {
                        VStack(alignment: .center) {
                            Text("Cluber for DIS")
                                .font(geometry.size.width < 350 ? .title3 : .title)
                                .fontWeight(.semibold)
                                .fontDesign(.rounded)
                                .foregroundStyle(Color(red: 0, green: 0.51, blue: 0.6))
                            
                            HStack {
                                Text("I'm enrolled in")
                                    .foregroundStyle(.black)
                                Text("\(clubCount)")
                                    .foregroundStyle(Color(red: 0, green: 0.51, blue: 0.6))
                                Text("Clubs!")
                            }
                            .font(geometry.size.width < 350 ? .title3 : .title)
                            .fontWeight(.medium)
                            .padding()
                            
                            if usernameGrade.schoolGrade == "Elementary" {
                                Image("gliderYellow")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geometry.size.width * 0.6, height: geometry.size.width * 0.6) // Adjusted size for screen width
                            } else if usernameGrade.schoolGrade == "Middle" {
                                Image("gliderPink")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geometry.size.width * 0.6, height: geometry.size.width * 0.6)
                            } else {
                                Image("gliderOrange")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geometry.size.width * 0.6, height: geometry.size.width * 0.6)
                            }
                            
                            Text(usernameGrade.userName)
                                .font(.title.bold())
                                .frame(width: geometry.size.width * 0.4, height: 40) // Adjust based on screen width
                                .background(.gray.opacity(0.4))
                                .clipShape(Capsule())
                                .padding()
                            
                            HStack(spacing: 1) {
                                ForEach(1...5, id: \.self) { day in
                                    VStack {
                                        Text(textConvert(num: day))
                                            .frame(width: geometry.size.width * 0.18, height: geometry.size.height * 0.05) // Adjusted for dynamic screen size
                                            .background(Color(red: 0, green: 0.51, blue: 0.6).opacity(0.35))
                                            .clipShape(Capsule())
                                            .foregroundColor(.white)
                                        
                                        switch usernameGrade.schoolGrade {
                                        case "Elementary":
                                            let clubsForDay = elementarySchoolLunchClubList.filter { $0.dayOfWeek == day && $0.isMember }
                                            if clubsForDay.isEmpty {
                                                Text("None")
                                                    .foregroundStyle(Color(red: 0, green: 0.51, blue: 0.6))
                                                    .frame(width: geometry.size.width * 0.18, height: geometry.size.height * 0.15) // Adjust frame size dynamically
                                                    .background(.gray.opacity(0.4))
                                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                            } else {
                                                ForEach(clubsForDay, id: \.self.clubName) { club in
                                                    Text(club.clubName)
                                                        .foregroundStyle(Color(red: 0, green: 0.51, blue: 0.6))
                                                        .frame(width: geometry.size.width * 0.18, height: geometry.size.height * 0.15)
                                                        .background(.gray.opacity(0.4))
                                                        .clipShape(RoundedRectangle(cornerRadius: 12))
                                                }
                                            }
                                            
                                        case "Middle":
                                            let clubsForDay = middleSchoolLunchClubList.filter { $0.dayOfWeek == day && $0.isMember }
                                            if clubsForDay.isEmpty {
                                                Text("None")
                                                    .foregroundStyle(Color(red: 0, green: 0.51, blue: 0.6))
                                                    .frame(width: geometry.size.width * 0.18, height: geometry.size.height * 0.15)
                                                    .background(.gray.opacity(0.4))
                                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                            } else {
                                                ForEach(clubsForDay, id: \.self.clubName) { club in
                                                    Text(club.clubName)
                                                        .foregroundStyle(Color(red: 0, green: 0.51, blue: 0.6))
                                                        .frame(width: geometry.size.width * 0.18, height: geometry.size.height * 0.15)
                                                        .background(.gray.opacity(0.4))
                                                        .clipShape(RoundedRectangle(cornerRadius: 12))
                                                }
                                            }
                                            
                                        case "High":
                                            let clubsForDay = highSchoolLunchClubList.filter { $0.dayOfWeek == day && $0.isMember }
                                            if clubsForDay.isEmpty {
                                                Text("None")
                                                    .foregroundStyle(Color(red: 0, green: 0.51, blue: 0.6))
                                                    .frame(width: geometry.size.width * 0.18, height: geometry.size.height * 0.15)
                                                    .background(.gray.opacity(0.4))
                                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                            } else {
                                                ForEach(clubsForDay, id: \.self.clubName) { club in
                                                    Text(club.clubName)
                                                        .foregroundStyle(Color(red: 0, green: 0.51, blue: 0.6))
                                                        .frame(width: geometry.size.width * 0.18, height: geometry.size.height * 0.15)
                                                        .background(.gray.opacity(0.4))
                                                        .clipShape(RoundedRectangle(cornerRadius: 12))
                                                }
                                            }
                                            
                                        default:
                                            Text("Choose Your Lunch Club")
                                        }
                                    }
                                }
                            }
                            .foregroundStyle(.black)
                            
                            
                            Button {
                                image = takeCapture()
                                inInstagram.toggle()
                            } label: {
                                HStack {
                                    if !inInstagram {
                                        Image(systemName: "camera.fill")
                                    }
                                    Text("Share with Instagram")
                                        .foregroundStyle(inInstagram ? Color(red: 0, green: 0.51, blue: 0.6) : .black )
                                        .fontDesign(.rounded)
                                        .fontWeight(.semibold)
                                }.foregroundStyle(.black)
                            }.padding()
                            
                            
                            if let image {
                                Button {
                                    instagramShare(image: image)
                                } label: {
                                    HStack {
                                        Image("instagram")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: geometry.size.width * 0.05, height: geometry.size.width * 0.05) // Adjusted icon size
                                        Text("Instagram Stories")
                                            .foregroundStyle(.white)
                                    }
                                    .frame(width: geometry.size.width * 0.5, height: geometry.size.height * 0.07) // Adjusted button size
                                    .background(.black.gradient)
                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                                }
                            }
                            
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                        .onAppear {
                            updateClubCount()
                        }
                        .onChange(of: usernameGrade.schoolGrade) { _ in
                            updateClubCount()
                        }
                        .fontDesign(.rounded)
                        
                        Spacer()
                    }.padding()
                }
                
            }
        }
        
    }
    
    func updateClubCount() {
        switch usernameGrade.schoolGrade {
        case "Elementary":
            clubCount = elementarySchoolLunchClubList.filter { $0.isMember }.count
        case "Middle":
            clubCount = middleSchoolLunchClubList.filter { $0.isMember }.count
        case "High":
            clubCount = highSchoolLunchClubList.filter { $0.isMember }.count
        default:
            clubCount = 0
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
        if let urlScheme = URL(string: "instagram-stories://share?source_application=885574550055108") {
            if UIApplication.shared.canOpenURL(urlScheme) {
                let pasteboardItems = [
                    [
                        "com.instagram.sharedSticker.backgroundImage": image.pngData()
                    ]
                ]
                
                let pasteboardOptions = [UIPasteboard.OptionsKey.expirationDate: Date().addingTimeInterval(60 * 5)]
                UIPasteboard.general.setItems(pasteboardItems, options: pasteboardOptions)
                
                UIApplication.shared.open(urlScheme as URL, options: [:], completionHandler: nil)
            } else {
                print("Instagram app is not installed.")
            }
        }
    }
    
    struct Photo: Transferable {
        public var image: Image
        
        static var transferRepresentation: some TransferRepresentation {
            ProxyRepresentation(exporting: \.image)
        }
    }
}

#Preview {
    IGShareView()
        .environmentObject(UsernameGradeClass())
}

func textConvert(num: Int) -> String {
    switch num {
    case 1:
        return "MON"
    case 2:
        return "TUE"
    case 3:
        return "WED"
    case 4:
        return "THU"
    case 5:
        return "FRI"
    default:
        return "Unknown"
    }
}
