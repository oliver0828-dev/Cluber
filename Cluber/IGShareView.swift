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
    
    @State private var instagramButton = false
    
    @State private var clubCount = 0
    
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
    if num == 1 {
        return "MON"
    } else if num == 2 {
        return "TUE"
    } else if num == 3 {
        return "WED"
    } else if num == 4 {
        return "THU"
    } else {
        return "FRI"
    }
}
