import SwiftUI

struct LunchClubView: View {
    
    @State var isTapped = false
    @State private var isLoved = false
    @State private var selectedDay: Int?
    @State private var highSchoolLunchClubList: [LunchClubStruct] = LunchClubList.HighSchool
    @State private var elementarySchoolLunchClubList: [LunchClubStruct] = LunchClubList.ElementarySchool
    @State private var middleSchoolLunchClubList: [LunchClubStruct] = LunchClubList.MiddleSchool
    
    @State private var lovedDays: [Int: Bool] = [:]
    
    @State private var searchText = ""
    
    @EnvironmentObject var usernameGrade: UsernameGradeClass
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        
        NavigationStack {
            VStack {
                // Hide the day buttons if search text is not empty
                if searchText.isEmpty {
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
                }
                
                List {
                    switch usernameGrade.schoolGrade {
                    case "Elementary":
                        ForEach(filteredClubs(for: elementarySchoolLunchClubList).indices, id: \.self) { index in
                            let elementarySchoolLunchClub = filteredClubs(for: elementarySchoolLunchClubList)[index]
                            if isClubVisible(club: elementarySchoolLunchClub) {
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
                                        instagramID: elementarySchoolLunchClub.instagramID,
                                        quarter: elementarySchoolLunchClub.quarter,
                                        aiGenerated: elementarySchoolLunchClub.aiGenerated,
                                        loved: $elementarySchoolLunchClubList[index].isMember,
                                        memberBoolean: $elementarySchoolLunchClubList[index].memberBoolean
                                    )
                                } label: {
                                    clubRow(club: elementarySchoolLunchClub)
                                }
                                .listRowBackground(Color.clear)
                            }
                        }
                    case "Middle":
                        ForEach(filteredClubs(for: middleSchoolLunchClubList).indices, id: \.self) { index in
                            let middleSchoolLunchClub = filteredClubs(for: middleSchoolLunchClubList)[index]
                            if isClubVisible(club: middleSchoolLunchClub) {
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
                                        instagramLink: middleSchoolLunchClub.instagramLink,
                                        instagramID: middleSchoolLunchClub.instagramID,
                                        quarter: middleSchoolLunchClub.quarter,
                                        aiGenerated: middleSchoolLunchClub.aiGenerated,
                                        loved: $middleSchoolLunchClubList[index].isMember,
                                        memberBoolean: $middleSchoolLunchClubList[index].memberBoolean
                                    )
                                } label: {
                                    clubRow(club: middleSchoolLunchClub)
                                }
                                .listRowBackground(Color.clear)
                            }
                        }
                    case "High":
                        ForEach(filteredClubs(for: highSchoolLunchClubList).indices, id: \.self) { index in
                            let highSchoolLunchClub = filteredClubs(for: highSchoolLunchClubList)[index]
                            if isClubVisible(club: highSchoolLunchClub) {
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
                                        instagramLink: highSchoolLunchClub.instagramLink,
                                        instagramID: highSchoolLunchClub.instagramID,
                                        quarter: highSchoolLunchClub.quarter,
                                        aiGenerated: highSchoolLunchClub.aiGenerated,
                                        loved: $highSchoolLunchClubList[index].isMember,
                                        memberBoolean: $highSchoolLunchClubList[index].memberBoolean
                                    )
                                } label: {
                                    clubRow(club: highSchoolLunchClub)
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
                Button {
                    isTapped.toggle()
                } label: {
                    Image(systemName: "square.and.arrow.up")
                }.sheet(isPresented: $isTapped) {
                    IGShareView()
                }
                
                Button {
                    isLoved.toggle()
                    if isLoved {
                        usernameGrade.memberBoolean = true
                    }
                } label: {
                    if isLoved == false {
                        Image(systemName: "arrow.up.arrow.down.circle")
                    } else {
                        Image(systemName: "arrow.up.arrow.down.circle.fill")
                    }
                    
                }
            }
            
        }
        .searchable(text: $searchText)
        
        
    }
    
    // Function to filter the clubs based on search text
    func filteredClubs(for clubs: [LunchClubStruct]) -> [LunchClubStruct] {
        if searchText.isEmpty {
            return clubs
        } else {
            return clubs.filter { $0.clubName.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    // Function to check if a club should be visible
    func isClubVisible(club: LunchClubStruct) -> Bool {
        if searchText.isEmpty {
            return club.dayOfWeek == selectedDay && (!isLoved || club.isMember)
        } else {
            
            let matchesSearchText = club.clubName.lowercased().contains(searchText.lowercased())
            return matchesSearchText && (!isLoved || club.isMember)
        }
    }
    
    func clubRow(club: LunchClubStruct) -> some View {
        HStack {
            if club.groupImage != "n/a" {
                Image(club.groupImage)
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
                Text(club.clubName)
                    .fontDesign(.rounded)
                    .fontWeight(.medium)
                if !club.subName.isEmpty {
                    Text(club.subName)
                        .font(.caption)
                        .foregroundColor(.gray)
                        .fontDesign(.rounded)
                }
            }
        }
    }
}


#Preview {
    LunchClubView()
        .environmentObject(UsernameGradeClass())
}
