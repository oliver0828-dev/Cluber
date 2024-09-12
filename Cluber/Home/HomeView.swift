import SwiftUI
import Combine
import Foundation


struct HomeView: View {
    @EnvironmentObject var usernameGrade: UsernameGradeClass
    @Environment(\.colorScheme) var colorScheme
    @State private var date = Date.now
    
    @ObservedObject var manager = GetCal()
    let username: String
    
    var body: some View {
        
        NavigationStack {
            GeometryReader { _ in
                ScrollView {
                    VStack {
                        HStack {
                            Text(getGreeting() + username)
                                .foregroundStyle(.black)
                                .font(.title)
                                .fontDesign(.rounded)
                                .fontWeight(.semibold)
                                .frame(width: 320, height: 40)
                                .background(CircleColor(gradeLevel: usernameGrade.schoolGrade, colorScheme: colorScheme))
                                .clipShape(RoundedRectangle(cornerRadius: 40))
                        }
                        Text(gradeYear(year: usernameGrade.gradeNumber))
                            .fontDesign(.rounded)
                            .foregroundStyle(.gray)
                        
                        DatePicker("Calendar", selection: $date, displayedComponents: .date)
                            .datePickerStyle(GraphicalDatePickerStyle())
                            .modifier(NavigationBarModifier())
                            .padding()
                        
                        VStack(alignment: .leading) {
                            RowView(data: manager.event, date: $date)
                                .frame(width: 350)
                                .fontWeight(.semibold)
                                .fontDesign(.rounded)
                                .background(.gray.opacity(0.2))
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                                .shadow(radius: 16)
                               
                        }
                    }
                    .padding()
                }
                .navigationTitle("Cluber")
                .modifier(NavigationBarModifier())
            }
            
        }
        
    }
    
    func getGreeting() -> String {
        let hour = Calendar.current.component(.hour, from: date)
        switch hour {
        case 5..<12:
            return "Good Morning, "
        case 12..<18:
            return "Good Afternoon, "
        default:
            return "Good Evening, "
        }
    }
}


#Preview {
    HomeView(username: "Oliver")
        .environmentObject(UsernameGradeClass())
        .environmentObject(GetCal())
}


func gradeYear(year: Int) -> String {
    switch year {
    case 1:
        return "1st Grade Version"
    case 2:
        return "2nd Grade Version"
    case 3:
        return "3rd Grade Version"
    case 4...8:
        return "\(year)th Grade Version"
    case 9:
        return "Freshman Version"
    case 10:
        return "Sophomore Version"
    case 11:
        return "Junior Version"
    case 12:
        return "Senior Version"
    default:
        return "Version"
    }
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
