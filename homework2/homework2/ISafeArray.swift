import Foundation

protocol ISafeArray {
    associatedtype T: Equatable
    var isEmpty: Bool { get }
    var count: Int { get }
    
    func append(_ item: T)
    func remove(at index: Int)
    func getSubscript(index: Int) -> T?
    func contains(_ element: T) -> Bool
}
