import Foundation

final class InfoViewModel {
    private var infoManager = InfoManager()
    var infoData: InfoStruct?
    var index: Int
    
    var onDataUpdated: ((String) -> Void)?
    
    init(index: Int) {
        self.index = index
        loadInfoAtIndex()
    }
    
    private func loadInfoAtIndex() {
        let dogInfo = infoManager.dogInformation
        guard index >= 0 && index < dogInfo.count else {
            print("Index out of range")
            return
        }
        infoData = dogInfo[index]
        let data = infoData?.information
        print("Data loaded: \(infoData?.information ?? "No data")")
        onDataUpdated?(data ?? "")
    }
}
