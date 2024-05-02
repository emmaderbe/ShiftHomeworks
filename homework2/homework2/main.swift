import Foundation

func main() {
    let safeArray = SafetyThreadArray<Int>()
    let customQueue = DispatchQueue(label: "customQueue", attributes: .concurrent)
    let group = DispatchGroup()
    
    group.enter()
    customQueue.async {
        for number in 0..<500 {
            safeArray.append(number)
        }
        group.leave()
    }
    
    group.enter()
    customQueue.async {
        for number in 500...1000 {
            safeArray.append(number)
        }
        group.leave()
    }
    
    group.wait()
    
    print("\(ConsoleMessage.arrayIsEmpty.rawValue) \(safeArray.isEmpty)")
    print("\(ConsoleMessage.arrayCount.rawValue) \(safeArray.count)")
    
    print(ConsoleMessage.arrayRemove.rawValue)
    safeArray.remove(at: -1)
    safeArray.remove(at: 0)
    safeArray.remove(at: 1)
    print("\(ConsoleMessage.arrayCountAfterRemove.rawValue)  \(safeArray.count)")
    
    print(ConsoleMessage.arrayContains.rawValue)
    _ = safeArray.contains(250)
    _ = safeArray.contains(2000)
    
    print(ConsoleMessage.arrayGetSubscript.rawValue)
    _ = safeArray.getSubscript(index: 101)
    _ = safeArray.getSubscript(index: 2000)    
}

main()
