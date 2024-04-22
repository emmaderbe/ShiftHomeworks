import Foundation

class SafetyThreadArray<T: Equatable>: ISafeArray {
    private var array: [T] = []
    private let semaphore = DispatchSemaphore(value: 1)
    
    var isEmpty: Bool {
        semaphore.wait()
        let result = array.isEmpty
        semaphore.signal()
        return result
    }
    
    var count: Int {
        semaphore.wait()
        let count = array.count
        semaphore.signal()
        return count
    }
    
    func append(_ item: T) {
        semaphore.wait()
        array.append(item)
        semaphore.signal()
    }
    
    func remove(at index: Int) {
        semaphore.wait()
        if index > 0 && index < array.count {
            let removedElement = array.remove(at: index)
            semaphore.signal()
            print("Успешно удалён элемент \(removedElement) под индексом \(index)")
        } else {
            semaphore.signal()
            print(SafetyArrayError.indexOutOfRange(index).description)
        }
    }
    
    func getSubscript(index: Int) -> T? {
        semaphore.wait()
        guard index > 0 && index < array.count else {
            semaphore.signal()
            print(SafetyArrayError.indexOutOfRange(index).description)
            return nil
        }
        let element = array[index]
        print("Найден элемент по введенному индексу - \(element)")
        semaphore.signal()
        return element
    }
    
    func contains(_ element: T) -> Bool {
        var doesContain = false
        semaphore.wait()
        doesContain = array.contains(element)
        semaphore.signal()
        if doesContain {
            print("Элемент \(element) найден в массиве.")
        } else {
            print(SafetyArrayError.elementNotFound(element).description)
        }
        return doesContain
    }
}
