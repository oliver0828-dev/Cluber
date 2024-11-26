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
    @State private var isLoved = false
    @AppStorage("Quarter") var quarter = "Q2"
    @State var quarterPicker = ["Q1", "Q2", "Q3"]
    
    @State private var searchText = ""
    
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var usernameGrade: UsernameGradeClass
    
    var body: some View {
        NavigationStack {
            
            VStack {
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
                        Text("Elementary Is Currently Not Available")
                    case "Middle":
                        ForEach(filteredASAs(for: middleSchoolASAList).indices, id: \.self) { index in
                            let middle = filteredASAs(for: middleSchoolASAList)[index]
                            if isClubVisible(club: middle) {
                                if middle.dayOfWeek == selectedDay && (!isLoved || middle.interested) {
                                    if quarterToString(quarter: middle.quarter) == quarter || quarterToString(quarter: middle.quarter) == "All" {
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
                                                instagramID: middle.instagramID,
                                                quarter: quarterToString(quarter: middle.quarter),
                                                sports: middle.sports,
                                                loved: $middleSchoolASAList[index].interested,
                                                memberBoolean: .constant(true)
                                            )
                                        } label: {
                                            clubRow(club: middle)
                                        }
                                        .listRowBackground(Color.clear)
                                    }
                                }
                            }
                        }
                    case "High":
                        ForEach(filteredASAs(for: highSchoolASAList).indices, id: \.self) { index in
                            let high = filteredASAs(for: highSchoolASAList)[index]
                            if isClubVisible(club: high) {
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
                                                instagramID: high.instagramID,
                                                quarter: quarterToString(quarter: high.quarter),
                                                sports: high.sports,
                                                loved: $highSchoolASAList[index].interested,
                                                memberBoolean: .constant(true)
                                            )
                                        } label: {
                                            clubRow(club: high)
                                        }
                                        .listRowBackground(Color.clear)
                                    }
                                }
                            }
                        }
                    default:
                        Text("No Lunch Club Available")
                    }
                }
                .scrollContentBackground(.hidden)
                
            }
            
            .navigationTitle("ASA")
            .modifier(NavigationBarModifier())
            .toolbar {
                Picker("Quarter", selection: $quarter) {
                    ForEach(quarterPicker, id: \.self) { s in
                        Text(s)
                    }
                }
                .pickerStyle(.segmented)
                
                Button {
                    isLoved.toggle()
                } label: {
                    Image(systemName: isLoved ? "arrow.up.arrow.down.circle.fill" : "arrow.up.arrow.down.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                }
            }
        }
        .searchable(text: $searchText)
    }
    
    func filteredASAs(for asa: [ASAStruct]) -> [ASAStruct] {
        if searchText.isEmpty {
            return asa
        } else {
            return asa.filter { $0.clubName.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    func isClubVisible(club: ASAStruct) -> Bool {
        if searchText.isEmpty {
            return club.dayOfWeek == selectedDay && (!isLoved || club.interested)
        } else {
            let matchesSearchText = club.clubName.lowercased().contains(searchText.lowercased())
            return matchesSearchText && (!isLoved || club.interested)
        }
    }
    
    func clubRow(club: ASAStruct) -> some View {
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
    
    func quarterToString(quarter: String) -> String {
        switch quarter {
        case "1": return "Q1"
        case "2": return "Q2"
        case "3": return "Q3"
        case "All": return "All"
        default: return "Invalid"
        }
    }
}

#Preview {
    ASAView()
        .environmentObject(UsernameGradeClass())
}
