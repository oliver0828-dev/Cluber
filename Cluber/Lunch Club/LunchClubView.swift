import SwiftUI
import ScreenshotableView

struct LunchClubView: View {
    
    @State var isTapped = false
    @State private var isLoved = false
    @State private var selectedDay: Int?
    @State private var highSchoolLunchClubList: [LunchClubStruct] = LunchClubList.HighSchool
    @State private var elementarySchoolLunchClubList: [LunchClubStruct] = LunchClubList.ElementarySchool
    @State private var middleSchoolLunchClubList: [LunchClubStruct] = LunchClubList.MiddleSchool
    
    @State private var lovedDays: [Int: Bool] = [:]
    
    @EnvironmentObject var usernameGrade: UsernameGradeClass
    @Environment(\.colorScheme) var colorScheme
    
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
                            selectedDay = day == selectedDay ? 1 : day
                        }, label: {
                            if selectedDay == day && colorScheme == .light {
                                Image(systemName: "\(day).circle")
                                    .resizable()
                                    .foregroundStyle(.indigo.opacity(0.8))
                                    .frame(width: 35, height: 35)
                                    .padding()
                            } else if selectedDay == day && colorScheme == .dark {
                                Image(systemName: "\(day).circle")
                                    .resizable()
                                    .foregroundStyle(.blue)
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
                            if elementarySchoolLunchClub.dayOfWeek == selectedDay && (!isLoved || elementarySchoolLunchClub.isMember) {
                                NavigationLink {
                                    ClubView(
                                        ClubName: elementarySchoolLunchClub.clubName,
                                        ClubTeacher: elementarySchoolLunchClub.teacherName,
                                        ClubImage: elementarySchoolLunchClub.groupImage,
                                        ClubSubName: elementarySchoolLunchClub.subName,
                                        description: elementarySchoolLunchClub.description,
                                        schoolLevel: "Elementary",
                                        roomNumber: elementarySchoolLunchClub.roomNumber,
                                        location: elementarySchoolLunchClub.location,
                                        socialMedia: elementarySchoolLunchClub.socialMedia,
                                        instagramLink: elementarySchoolLunchClub.instagramLink,
                                        instagramID: elementarySchoolLunchClub.instagramID,quarter: elementarySchoolLunchClub.quarter, aiGenerated: elementarySchoolLunchClub.aiGenerated,
                                        loved: $elementarySchoolLunchClubList[index].isMember, memberBoolean: $elementarySchoolLunchClubList[index].memberBoolean
                                    )
                                } label: {
                                    HStack {
                                        Image(elementarySchoolLunchClub.groupImage)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 150, height: 100)
                                            .clipShape(RoundedRectangle(cornerRadius: 15))
                                        VStack(alignment: .leading) {
                                            if elementarySchoolLunchClub.groupImage != "n/a" {
                                                Text(elementarySchoolLunchClub.clubName)
                                                    .fontDesign(.rounded)
                                                    .fontWeight(.medium)
                                            } else {
                                                Image(systemName: "photo")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 150, height: 100)
                                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                                            }
                                            if !elementarySchoolLunchClub.subName.isEmpty {
                                                Text(elementarySchoolLunchClub.subName)
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
                        ForEach(middleSchoolLunchClubList.indices, id: \.self) { index in
                            let middleSchoolLunchClub = middleSchoolLunchClubList[index]
                            if middleSchoolLunchClub.dayOfWeek == selectedDay && (!isLoved || middleSchoolLunchClub.isMember) {
                                NavigationLink {
                                    ClubView(
                                        ClubName: middleSchoolLunchClub.clubName,
                                        ClubTeacher: middleSchoolLunchClub.teacherName,
                                        ClubImage: middleSchoolLunchClub.groupImage,
                                        ClubSubName: middleSchoolLunchClub.subName,
                                        description: middleSchoolLunchClub.description,
                                        schoolLevel: "Middle",
                                        roomNumber: middleSchoolLunchClub.roomNumber,
                                        location: middleSchoolLunchClub.location,
                                        socialMedia: middleSchoolLunchClub.socialMedia,
                                        instagramLink: middleSchoolLunchClub.instagramLink,instagramID: middleSchoolLunchClub.instagramID, quarter: middleSchoolLunchClub.quarter,
                                        aiGenerated: middleSchoolLunchClub.aiGenerated,
                                        loved: $middleSchoolLunchClubList[index].isMember, memberBoolean: $middleSchoolLunchClubList[index].memberBoolean
                                    )
                                } label: {
                                    HStack {
                                        if middleSchoolLunchClub.groupImage != "n/a" {
                                            Image(middleSchoolLunchClub.groupImage)
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
                                            
                                            Text(middleSchoolLunchClub.clubName)
                                                .fontDesign(.rounded)
                                                .fontWeight(.medium)
                                            
                                            if !middleSchoolLunchClub.subName.isEmpty{
                                                Text(middleSchoolLunchClub.subName)
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
                        ForEach(highSchoolLunchClubList.indices, id: \.self) { index in
                            let highSchoolLunchClub = highSchoolLunchClubList[index]
                            if highSchoolLunchClub.dayOfWeek == selectedDay && (!isLoved || highSchoolLunchClub.isMember) {
                                NavigationLink {
                                    ClubView(
                                        ClubName: highSchoolLunchClub.clubName,
                                        ClubTeacher: highSchoolLunchClub.teacherName,
                                        ClubImage: highSchoolLunchClub.groupImage,
                                        ClubSubName: highSchoolLunchClub.subName,
                                        description: highSchoolLunchClub.description,
                                        schoolLevel: "High",
                                        roomNumber: highSchoolLunchClub.roomNumber,
                                        location: highSchoolLunchClub.location,
                                        socialMedia: highSchoolLunchClub.socialMedia,
                                        instagramLink: highSchoolLunchClub.instagramLink, instagramID: highSchoolLunchClub.instagramID, quarter: highSchoolLunchClub.quarter, aiGenerated: highSchoolLunchClub.aiGenerated,
                                        loved: $highSchoolLunchClubList[index].isMember, memberBoolean: $highSchoolLunchClubList[index].memberBoolean
                                    )
                                } label: {
                                    HStack {
                                        if highSchoolLunchClub.groupImage != "n/a" {
                                            Image(highSchoolLunchClub.groupImage)
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
                                            Text(highSchoolLunchClub.clubName)
                                                .fontDesign(.rounded)
                                                .fontWeight(.medium)
                                            if !highSchoolLunchClub.subName.isEmpty {
                                                Text(highSchoolLunchClub.subName)
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
            .navigationTitle("Lunch Club")
            .modifier(NavigationBarModifier())
            .toolbar {
                // Instagram Share View
                Button {
                    isTapped.toggle()
                } label: {
                    Image(systemName: "square.and.arrow.up")
                }.sheet(isPresented: $isTapped) {
                    IGShareView()
                }
                
                Button {
                    isLoved.toggle()
                } label: {
                    if isLoved == false {
                        Image(systemName: "arrow.up.arrow.down.circle")
                    } else {
                        Image(systemName: "arrow.up.arrow.down.circle.fill")
                    }
                    
                }
            }
            
        }
      
        
    }
}



#Preview {
    LunchClubView()
        .environmentObject(UsernameGradeClass())
}
