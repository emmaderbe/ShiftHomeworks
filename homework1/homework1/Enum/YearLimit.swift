import Foundation

enum YearLimit: Int {
    case fistCarInHistoryYear = 1885
    case numCount = 4
    
    static var currentYear: Int {
        return Calendar.current.component(.year, from: Date())
    }
}
