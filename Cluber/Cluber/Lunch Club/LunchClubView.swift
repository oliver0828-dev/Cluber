//
//  LunchClubView.swift
//  Cluber
//
//  Created by Oliver Park on 4/23/24.
//

import SwiftUI

struct LunchClubView: View {
    @State private var dayNumber = 1
    @State private var isTapped = false
    @State private var highSchoollunchclubList: [LunchClubStruct] = LunchClubList.HighSchool
    @State private var elementarySchoolLunchClubList: [LunchClubStruct] = LunchClubList.ElementarySchool
    @State private var middleSchoolLunchClubList: [LunchClubStruct] = LunchClubList.MiddleSchool
    
    @EnvironmentObject var usernameGrade: UsernameGradeClass
    
    var body: some View {
        NavigationStack {
            Text(dayOfWeek(for: dayNumber))
                .font(.title)
                .fontWeight(.semibold)
            HStack {
                ForEach(1..<6) { day in
                    Button(action: {
                        print(dayOfWeek(for: dayNumber))
                        dayNumber = day
                        
                    }, label: {
                        Image(systemName: "\(day).circle.fill")
                            .resizable()
                            .frame(width: 35, height: 35)
                            .padding()
                    })
                    
                }
            }
            
            List {
                switch usernameGrade.grade {
                case "Elementary":
                    ForEach(elementarySchoolLunchClubList.indices, id: \.self) { index in
                        let elementarySchoolLunchClub = elementarySchoolLunchClubList[index]
                        if elementarySchoolLunchClub.dayOfWeek == dayNumber {
                            NavigationLink(elementarySchoolLunchClub.clubName, destination: ClubView(lunchClubName: elementarySchoolLunchClub.clubName, lunchClubTeacher: elementarySchoolLunchClub.teacherName, lunchClubImage: elementarySchoolLunchClub.groupImage, teacherImage: elementarySchoolLunchClub.teacherImage))
                        }
                        
                    }
                case "Middle":
                    ForEach(middleSchoolLunchClubList.indices, id: \.self) { index in
                        let middleSchoolLunchClub = middleSchoolLunchClubList[index]
                        if middleSchoolLunchClub.dayOfWeek == dayNumber {
                            NavigationLink(middleSchoolLunchClub.clubName, destination: ClubView(lunchClubName: middleSchoolLunchClub.clubName, lunchClubTeacher: middleSchoolLunchClub.teacherName, lunchClubImage: middleSchoolLunchClub.groupImage, teacherImage: middleSchoolLunchClub.teacherImage))
                        }
                        
                    }
                case "High":
                    ForEach(highSchoollunchclubList.indices, id: \.self) { index in
                        let highSchoolLunchClub = highSchoollunchclubList[index]
                        if highSchoolLunchClub.dayOfWeek == dayNumber {
                            NavigationLink(highSchoolLunchClub.clubName, destination: ClubView(lunchClubName: highSchoolLunchClub.clubName, lunchClubTeacher: highSchoolLunchClub.teacherName, lunchClubImage: highSchoolLunchClub.groupImage, teacherImage: highSchoolLunchClub.teacherImage))
                        }
                        
                    }
                default:
                    Text("No lunch clubs available.")
                }
            }
            .navigationTitle("Lunch Club")
        }
    }
}
