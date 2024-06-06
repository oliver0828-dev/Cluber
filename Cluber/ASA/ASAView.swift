//
//  ASAView.swift
//  Cluber
//
//  Created by Oliver Park on 4/23/24.
//

import SwiftUI

struct ASAView: View {
    @State var selectedDay: Int?
    @State var highSchoolASAList = ASAList.HighSchool
    @State var middleSchoolASAList = ASAList.Middle
    @State var elementaryASAList = ASAList.Elementary
    
    @EnvironmentObject var usernameGrade: UsernameGradeClass
    
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(dayOfWeek(for: selectedDay ?? 1))
                    .font(.title.bold())
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
                    case "High":
                        ForEach(highSchoolASAList.indices, id: \.self) { i in
                            let HighSchool = highSchoolASAList[i]
                            if HighSchool.dayOfWeek == selectedDay {
                                NavigationLink(HighSchool.clubName, destination: ASADetailView(ASAName: HighSchool.clubName, ASATeacher: HighSchool.teacherName, ASAImage: HighSchool.groupImage, ASASubName: HighSchool.subName, description: HighSchool.description, roomNumber: HighSchool.roomNumber))
                            }
                        }
                        
                    case "Middle":
                        ForEach(middleSchoolASAList.indices, id: \.self) { i in
                            let Middle = middleSchoolASAList[i]
                            if Middle.dayOfWeek == selectedDay {
                                NavigationLink(Middle.clubName, destination: ASADetailView(ASAName: Middle.clubName, ASATeacher: Middle.teacherName, ASAImage: Middle.groupImage, ASASubName: Middle.subName, description: Middle.description, schoolLevel: "Middle", roomNumber: Middle.roomNumber))
                            }
                        }
                        
                    case "Elementary":
                        ForEach(elementaryASAList.indices, id: \.self) { i in
                            let elementary = elementaryASAList[i]
                            if elementary.dayOfWeek == selectedDay {
                                NavigationLink(elementary.clubName, destination: ASADetailView(ASAName: elementary.clubName, ASATeacher: elementary.teacherName, ASAImage: elementary.groupImage, ASASubName: elementary.subName,description: elementary.description, schoolLevel: "Elementary", roomNumber: elementary.roomNumber))
                            }
                            
                        }
                        
                    default:
                        Text("NO ASA AVAILABLE")
                    }
                }
            }
            .navigationTitle("ASA")
        }
    }
}

#Preview {
    ASAView()
        .environmentObject(UsernameGradeClass())
}
