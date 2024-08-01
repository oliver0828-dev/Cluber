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
    
    @State private var instagramButton = false
    
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
                                            if elementarySchoolLunchClub.dayOfWeek == day && elementarySchoolLunchClub.interested {
                                                Text(elementarySchoolLunchClub.clubName)
                                                    .padding()
                                            }
                                        }
                                    }
                                case "Middle":
                                    VStack(alignment: .leading) {
                                        ForEach(middleSchoolLunchClubList.indices, id: \.self) { index in
                                            let middleSchoolLunchClub = middleSchoolLunchClubList[index]
                                            if middleSchoolLunchClub.dayOfWeek == day && middleSchoolLunchClub.interested {
                                                Text(middleSchoolLunchClub.clubName)
                                                    .padding()
                                            }
                                        }
                                    }
                                case "High":
                                    VStack (alignment: .leading){
                                        ForEach(highSchoolLunchClubList.indices, id: \.self) { index in
                                            let highSchoolLunchClub = highSchoolLunchClubList[index]
                                            if highSchoolLunchClub.dayOfWeek == day && highSchoolLunchClub.interested {
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
                    print("Sharing with Instagram")
                    instagramButton.toggle()
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
                }.alert(isPresented: $instagramButton) {
                    Alert(title: Text("The Feature Is Currently Unavailable"))
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
}

#Preview {
    LunchClubShareView()
        .environmentObject(UsernameGradeClass())
}
