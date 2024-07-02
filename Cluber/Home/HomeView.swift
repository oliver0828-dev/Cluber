import SwiftUI
import Combine
import Foundation


struct HomeView: View {
    @EnvironmentObject var usernameGrade: UsernameGradeClass
    @Environment(\.colorScheme) var colorScheme
    @State private var date = Date.now
    let username: String
    
    var body: some View {
        NavigationStack {
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
                        .padding()
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 350, height: 200)
                    }
                    
                    Spacer()
                }
                .navigationTitle("Cluber")
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
}

#Preview {
    HomeView(username: "Oliver")
        .environmentObject(UsernameGradeClass())
}



