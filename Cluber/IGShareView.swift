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
    
    var body: some View {
        GeometryReader { _ in
            ZStack {
                Image("igShareImage")
                    .frame(maxWidth: 200)
                    .ignoresSafeArea()
                
                VStack {
                    VStack(alignment: .center) {
                        HStack {
                            Text("I'm enrolled in")
                                .foregroundStyle(.black)
                            Text("\(clubCount)")
                                .foregroundStyle(Color(red: 0, green: 0.51, blue: 0.6))
                            Text("Clubs!")
                        }
                        .font(.title)
                        .fontWeight(.medium)
                        .padding()
                        
                        if usernameGrade.schoolGrade == "Elementary" {
                            Image("gliderYellow")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 250, height: 250)
                        } else if usernameGrade.schoolGrade == "Middle" {
                            Image("gliderPink")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 250, height: 250)
                        } else {
                            Image("gliderOrange")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 250, height: 250)
                        }
                        
                        Text(usernameGrade.userName)
                            .font(.title.bold())
                            .frame(width: 140, height: 40)
                            .background(.gray.opacity(0.4))
                            .clipShape(.capsule)
                            .padding()
                        
                        HStack(spacing: 1) {
                            ForEach(1...5, id: \.self) { day in
                                VStack {
                                    Text(textConvert(num: day))
                                        .frame(width: 70, height: 31)
                                        .background(Color(red: 0, green: 0.51, blue: 0.6).opacity(0.35))
                                        .clipShape(Capsule())
                                        .foregroundColor(.white)
                                    
                                    switch usernameGrade.schoolGrade {
                                    case "Elementary":
                                        let clubsForDay = elementarySchoolLunchClubList.filter { $0.dayOfWeek == day && $0.isMember }
                                        if clubsForDay.isEmpty {
                                            Text("None")
                                                .foregroundStyle(Color(red: 0, green: 0.51, blue: 0.6))
                                                .frame(width: 70, height: 100)
                                                .background(.gray.opacity(0.4))
                                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                        } else {
                                            ForEach(clubsForDay, id: \.self.clubName) { club in
                                                Text(club.clubName)
                                                    .foregroundStyle(Color(red: 0, green: 0.51, blue: 0.6))
                                                    .frame(width: 70, height: 100)
                                                    .background(.gray.opacity(0.4))
                                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                            }
                                        }
                                        
                                    case "Middle":
                                        let clubsForDay = middleSchoolLunchClubList.filter { $0.dayOfWeek == day && $0.isMember }
                                        if clubsForDay.isEmpty {
                                            Text("None")
                                                .foregroundStyle(Color(red: 0, green: 0.51, blue: 0.6))
                                                .frame(width: 70, height: 100)
                                                .background(.gray.opacity(0.4))
                                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                        } else {
                                            ForEach(clubsForDay, id: \.self.clubName) { club in
                                                Text(club.clubName)
                                                    .foregroundStyle(Color(red: 0, green: 0.51, blue: 0.6))
                                                    .frame(width: 70, height: 100)
                                                    .background(.gray.opacity(0.4))
                                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                            }
                                        }
                                        
                                    case "High":
                                        let clubsForDay = highSchoolLunchClubList.filter { $0.dayOfWeek == day && $0.isMember }
                                        if clubsForDay.isEmpty {
                                            Text("None")
                                                .foregroundStyle(Color(red: 0, green: 0.51, blue: 0.6))
                                                .frame(width: 70, height: 100)
                                                .background(.gray.opacity(0.4))
                                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                        } else {
                                            ForEach(clubsForDay, id: \.self.clubName) { club in
                                                Text(club.clubName)
                                                    .foregroundStyle(Color(red: 0, green: 0.51, blue: 0.6))
                                                    .frame(width: 70, height: 100)
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
                            Spacer()
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .onAppear {
                        updateClubCount()
                    }
                    .onChange(of: usernameGrade.schoolGrade) { _ in
                        updateClubCount()
                    }
                    .fontDesign(.rounded)
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

#Preview {
    IGShareView()
        .environmentObject(UsernameGradeClass())
}

func CircleColor(gradeLevel: String, colorScheme: ColorScheme) -> Color {
    switch (gradeLevel, colorScheme) {
    case ("Elementary", .light):
        return Color("yellowDark")
    case ("Elementary", .dark):
        return .yellow.opacity(0.7)
    case ("Middle", .light):
        return .blue.opacity(0.5)
    case ("Middle", .dark):
        return .blue
    case ("High", .light):
        return .green.opacity(0.7)
    case ("High", .dark):
        return .green
    default:
        return .white
    }
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
