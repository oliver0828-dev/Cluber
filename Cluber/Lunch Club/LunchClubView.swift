import SwiftUI

struct LunchClubView: View {
    
    @State private var selectedDay: Int?
    @State private var highSchoolLunchClubList: [LunchClubStruct] = LunchClubList.HighSchool
    @State private var elementarySchoolLunchClubList: [LunchClubStruct] = LunchClubList.ElementarySchool
    @State private var middleSchoolLunchClubList: [LunchClubStruct] = LunchClubList.MiddleSchool
    
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
                    case "Elementary":
                        ForEach(elementarySchoolLunchClubList.indices, id: \.self) { index in
                            let elementarySchoolLunchClub = elementarySchoolLunchClubList[index]
                            if elementarySchoolLunchClub.dayOfWeek == selectedDay {
                                NavigationLink(elementarySchoolLunchClub.clubName, destination: ClubView(lunchClubName: elementarySchoolLunchClub.clubName, lunchClubTeacher: elementarySchoolLunchClub.teacherName, lunchClubImage: elementarySchoolLunchClub.groupImage, lunchClubSubName: elementarySchoolLunchClub.subName, description: elementarySchoolLunchClub.description, schoolLevel: "Elementary", roomNumber: elementarySchoolLunchClub.roomNumber, location: elementarySchoolLunchClub.location, socialMedia: elementarySchoolLunchClub.socialMedia, instagramLink: elementarySchoolLunchClub.instagramLink, instagramID: elementarySchoolLunchClub.instagramID, loved: elementarySchoolLunchClub.interested))
                            }
                        }
                    case "Middle":
                        ForEach(middleSchoolLunchClubList.indices, id: \.self) { index in
                            let middleSchoolLunchClub = middleSchoolLunchClubList[index]
                            if middleSchoolLunchClub.dayOfWeek == selectedDay {
                                NavigationLink(middleSchoolLunchClub.clubName, destination: ClubView(lunchClubName: middleSchoolLunchClub.clubName, lunchClubTeacher: middleSchoolLunchClub.teacherName, lunchClubImage: middleSchoolLunchClub.groupImage, lunchClubSubName: middleSchoolLunchClub.subName, description: middleSchoolLunchClub.description, schoolLevel: "Middle", roomNumber: middleSchoolLunchClub.roomNumber, location: middleSchoolLunchClub.location, socialMedia: middleSchoolLunchClub.socialMedia, instagramLink: middleSchoolLunchClub.instagramLink, instagramID: middleSchoolLunchClub.instagramID, loved: middleSchoolLunchClub.interested))
                            }
                        }
                    case "High":
                        ForEach(highSchoolLunchClubList.indices, id: \.self) { index in
                            let highSchoolLunchClub = highSchoolLunchClubList[index]
                            if highSchoolLunchClub.dayOfWeek == selectedDay {
                                NavigationLink(highSchoolLunchClub.clubName, destination: ClubView(lunchClubName: highSchoolLunchClub.clubName, lunchClubTeacher: highSchoolLunchClub.teacherName, lunchClubImage: highSchoolLunchClub.groupImage, lunchClubSubName: highSchoolLunchClub.subName, description: highSchoolLunchClub.description, schoolLevel: "High", roomNumber: highSchoolLunchClub.roomNumber, location: highSchoolLunchClub.location, socialMedia: highSchoolLunchClub.socialMedia, instagramLink: highSchoolLunchClub.instagramLink,instagramID: highSchoolLunchClub.instagramID, loved: highSchoolLunchClub.interested))
                            }
                        }
                    default:
                        Text("No Lunch Club Available")
                    }
                }
                .navigationTitle("Lunch Club")
            }
        }
    }
}

#Preview {
    LunchClubView()
        .environmentObject(UsernameGradeClass())
}
