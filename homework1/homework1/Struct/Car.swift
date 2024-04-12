import Foundation

// MARK: - Properties
struct Car {
    let manufacturer: String
    let model: String
    let body: Body
    var yearOfIssue: Int?
    let carNumber: String?
}

// MARK: - description() - составление макета об автомобиле
extension Car {
    func description() -> String {
        let yearString = yearOfIssue.map(String.init) ?? "-"
        let carNumberString = carNumber.map { "Гос. номер: \($0)\n" } ?? ""
        return "Производитель: \(manufacturer)\n" +
               "Модель: \(model)\n" +
               "Тип кузова: \(body.rawValue)\n" +
               "Год выпуска: \(yearString)\n" +
               carNumberString
    }
}


