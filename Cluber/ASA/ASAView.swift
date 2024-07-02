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
    @State private var elementaryASAList: [ASAStruct] = ASAList.Elementary
    @State private var isLoved = false
    
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var usernameGrade: UsernameGradeClass
    
    
    var body: some View {
        NavigationStack {
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
                
                 List {
                    switch usernameGrade.schoolGrade {
                    case "Elementary":
                        ForEach(elementaryASAList.indices, id: \.self) { index in
                            let elementary = elementaryASAList[index]
                            if elementary.dayOfWeek == selectedDay && (!isLoved || elementary.interested) {
                                NavigationLink {
                                    ClubView(
                                        lunchClubName: elementary.clubName,
                                        lunchClubTeacher: elementary.teacherName,
                                        lunchClubImage: elementary.groupImage,
                                        lunchClubSubName: elementary.subName,
                                        description: elementary.description,
                                        schoolLevel: "Elementary",
                                        roomNumber: elementary.roomNumber,
                                        location: elementary.location,
                                        socialMedia: elementary.socialMedia,
                                        instagramLink: elementary.instagramLink,
                                        instagramID: elementary.instagramID,
                                        loved: $elementaryASAList[index].interested, memberBoolean: .constant(true)
                                        )
                                } label: {
                                    HStack {
                                        Image(elementary.groupImage)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 150, height: 100)
                                            .clipShape(RoundedRectangle(cornerRadius: 15))
                                        VStack(alignment: .leading) {
                                            Text(elementary.clubName)
                                                .fontDesign(.rounded)
                                                .fontWeight(.medium)
                                            if !elementary.subName.isEmpty {
                                                Text(elementary.subName)
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
                    case "Middle":
                        ForEach(middleSchoolASAList.indices, id: \.self) { index in
                            let middle = middleSchoolASAList[index]
                            if middle.dayOfWeek == selectedDay && (!isLoved || middle.interested) {
                                NavigationLink {
                                    ClubView(
                                        lunchClubName: middle.clubName,
                                        lunchClubTeacher: middle.teacherName,
                                        lunchClubImage: middle.groupImage,
                                        lunchClubSubName: middle.subName,
                                        description: middle.description,
                                        schoolLevel: "Middle",
                                        roomNumber: middle.roomNumber,
                                        location: middle.location,
                                        socialMedia: middle.socialMedia,
                                        instagramLink: middle.instagramLink,
                                        instagramID: middle.instagramID,
                                        loved: $middleSchoolASAList[index].interested, memberBoolean: .constant(true)
                                    )
                                } label: {
                                    HStack {
                                        Image(middle.groupImage)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 150, height: 100)
                                            .clipShape(RoundedRectangle(cornerRadius: 15))
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
                    case "High":
                        ForEach(highSchoolASAList.indices, id: \.self) { index in
                            let high = highSchoolASAList[index]
                            if high.dayOfWeek == selectedDay && (!isLoved || high.interested) {
                                NavigationLink {
                                    ClubView(
                                        lunchClubName: high.clubName,
                                        lunchClubTeacher: high.teacherName,
                                        lunchClubImage: high.groupImage,
                                        lunchClubSubName: high.subName,
                                        description: high.description,
                                        schoolLevel: "High",
                                        roomNumber: high.roomNumber,
                                        location: high.location,
                                        socialMedia: high.socialMedia,
                                        instagramLink: high.instagramLink,
                                        instagramID: high.instagramID,
                                        loved: $highSchoolASAList[index].interested, memberBoolean: .constant(true)
                                    )
                                } label: {
                                    HStack {
                                        Image(high.groupImage)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 150, height: 100)
                                            .clipShape(RoundedRectangle(cornerRadius: 15))
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
                    default:
                        Text("No Lunch Club Available")
                    }
                }
                .scrollContentBackground(.hidden)
            }
            .scrollContentBackground(.hidden)
            .toolbar {
                
                Text(usernameGrade.schoolGrade)
                    .frame(width: 120, height: 40)
                    .foregroundStyle(.black)
                    .background(CircleColor(gradeLevel: usernameGrade.schoolGrade, colorScheme: colorScheme))
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                
                
                Button {
                    isLoved.toggle()
                } label: {
                    if isLoved == false {
                        Image(systemName: "arrow.up.arrow.down.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    } else {
                        Image(systemName: "arrow.up.arrow.down.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }
                    
                }
            }
        }
        .navigationTitle("ASA")
    }
}

#Preview {
    ASAView()
        .environmentObject(UsernameGradeClass())
}
