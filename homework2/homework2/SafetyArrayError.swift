import Foundation

enum SafetyArrayError: Error, CustomStringConvertible {
    case indexOutOfRange(Int)
    case elementNotFound(Any)
    
    var description: String {
        switch self {
        case .indexOutOfRange(let index):
            return "Ошибка: введенный индекс \(index) находится за пределами искомого массива."
        case .elementNotFound(let element):
            return "Ошибка: введенный элемент \(element) не найден в массиве."
        }
    }
}
