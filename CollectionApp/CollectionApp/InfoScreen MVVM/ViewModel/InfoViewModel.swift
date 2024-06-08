import Foundation

protocol InfoViewModelDelegate: AnyObject {
    func infoViewModelDidUpdateInformation(with information: String)
}

protocol InfoViewModelProtocol {
    var delegate: InfoViewModelDelegate? {get set}
    func viewDidLoad()
    func startUpdating()
}

// MARK: - Properties and init()
final class InfoViewModel: InfoViewModelProtocol {
    var index: Int
    weak var delegate: InfoViewModelDelegate?
    private var infoManager: InfoManagerProtocol
    private var timer: Timer?
    
    init(index: Int, infoManager: InfoManagerProtocol = InfoManager()) {
        self.index = index
        self.infoManager = infoManager
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        timer?.invalidate()
    }
}

// MARK: - InfoViewModel Protocol functionality
extension InfoViewModel {
    func viewDidLoad() {
        loadInfo()
    }
    
    func startUpdating() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: TimeInterval.random(in: 5...10), repeats: true) { [weak self] _ in
            self?.loadInfo()
        }
    }
}

private extension InfoViewModel {
    func loadInfo() {
        let dogInfo = infoManager.dogInformation
        guard index >= 0 && index < dogInfo.count else {
            delegate?.infoViewModelDidUpdateInformation(with: "Index out of range")
            return
        }
        let infoData = dogInfo[index].information
        delegate?.infoViewModelDidUpdateInformation(with: infoData)
    }
}


