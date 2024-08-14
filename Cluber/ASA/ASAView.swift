//
//  ASAView.swift
//  Cluber
//
//  Created by Oliver Park on 4/23/24.
//

import SwiftUI

struct ASAView: View {
    @State var selectedDay: Int?
    @State private var highSchoolASAList: [ASAStruct] = ASAList.HighSchool
    @State private var middleSchoolASAList: [ASAStruct] = ASAList.Middle
    
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var usernameGrade: UsernameGradeClass
    
    @Binding var isLoved: Bool
    @Binding var quarter: String
    
    var body: some View {
        VStack {
            Text(dayOfWeek(for: selectedDay ?? 1))
                .font(.title.bold())
                .fontDesign(.rounded)
            
            HStack {
                ForEach(1..<6) { day in
                    Button(action: {
                        print(dayOfWeek(for: day))
                        selectedDay = day == selectedDay ? nil : day
                    }, label: {
                        if selectedDay == day {
                            Image(systemName: "\(day).circle")
                                .resizable()
                                .foregroundStyle(.indigo.opacity(0.8))
                                .frame(width: 35, height: 35)
                                .padding()
                        } else {
                            Image(systemName: "\(day).circle.fill")
                                .resizable()
                                .foregroundStyle(.green.opacity(0.9))
                                .frame(width: 35, height: 35)
                                .padding()
                        }
                    })
                }
            }
            .padding()
            
            List {
                switch usernameGrade.schoolGrade {
                case "Elementary":
                    Text("Elementary Is Currently Not Available")
                case "Middle":
                    ForEach(middleSchoolASAList.indices, id: \.self) { index in
                        let middle = middleSchoolASAList[index]
                        if middle.dayOfWeek == selectedDay && (!isLoved || middle.interested) {
                            if quarterToString(quarter: middle.quarter) == quarter || quarterToString(quarter: middle.quarter) == "All"{
                                NavigationLink {
                                    ClubView(
                                        ClubName: middle.clubName,
                                        ClubTeacher: middle.teacherName,
                                        ClubImage: middle.groupImage,
                                        ClubSubName: middle.subName,
                                        description: middle.description,
                                        schoolLevel: "Middle",
                                        roomNumber: middle.roomNumber,
                                        location: middle.location,
                                        socialMedia: middle.socialMedia,
                                        instagramLink: middle.instagramLink,
                                        instagramID: middle.instagramID, quarter: quarterToString(quarter: middle.quarter), sports: middle.sports,
                                        loved: $middleSchoolASAList[index].interested, memberBoolean: .constant(true)
                                    )
                                } label: {
                                    HStack {
                                        if middle.groupImage != "n/a" {
                                            Image(middle.groupImage)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 150, height: 100)
                                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                        } else {
                                            Image(systemName: "photo")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 150, height: 100)
                                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                        }
                                        VStack(alignment: .leading) {
                                            
                                            Text(middle.clubName)
                                                .fontDesign(.rounded)
                                                .fontWeight(.medium)
                                            
                                            if !middle.subName.isEmpty{
                                                Text(middle.subName)
                                                    .font(.caption)
                                                    .foregroundColor(.gray)
                                                    .fontDesign(.rounded)
                                            }
                                        }
                                    }
                                }
                                .listRowBackground(Color.clear)
                            }
                        }
                    }
                case "High":
                    ForEach(highSchoolASAList.indices, id: \.self) { index in
                        let high = highSchoolASAList[index]
                        if high.dayOfWeek == selectedDay && (!isLoved || high.interested) {
                            if quarterToString(quarter: high.quarter) == quarter || quarterToString(quarter: high.quarter) == "All" {
                                NavigationLink {
                                    ClubView(
                                        ClubName: high.clubName,
                                        ClubTeacher: high.teacherName,
                                        ClubImage: high.groupImage,
                                        ClubSubName: high.subName,
                                        description: high.description,
                                        schoolLevel: "High",
                                        roomNumber: high.roomNumber,
                                        location: high.location,
                                        socialMedia: high.socialMedia,
                                        instagramLink: high.instagramLink,
                                        instagramID: high.instagramID, quarter: quarterToString(quarter: high.quarter), sports: high.sports,
                                        loved: $highSchoolASAList[index].interested, memberBoolean: .constant(true)
                                    )
                                } label: {
                                    HStack {
                                        if high.groupImage != "n/a" {
                                            Image(high.groupImage)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 150, height: 100)
                                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                        } else {
                                            Image(systemName: "photo")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 150, height: 100)
                                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                        }
                                        VStack(alignment: .leading) {
                                            Text(high.clubName)
                                                .fontDesign(.rounded)
                                                .fontWeight(.medium)
                                            if !high.subName.isEmpty {
                                                Text(high.subName)
                                                    .font(.caption)
                                                    .foregroundColor(.gray)
                                                    .fontDesign(.rounded)
                                            }
                                        }
                                    }
                                }
                                .listRowBackground(Color.clear)
                            }
                        }
                    }
                default:
                    Text("No Lunch Club Available")
                }
            }
        }
        .navigationTitle("ASA")
        .modifier(NavigationBarModifier())
        .scrollContentBackground(.hidden)
    }
    
    func quarterToString(quarter: String) -> String {
        if quarter == "1" {
            return "Q1"
        } else if quarter == "2" {
            return "Q2"
        } else if quarter == "3" {
            return "Q3"
        } else if quarter == "All"{
            return "All"
        } else {
            return "Invalid"
        }
    }
    
}

#Preview {
    ASAView(isLoved: .constant(false), quarter: .constant("Q1"))
        .environmentObject(UsernameGradeClass())
}
