import UIKit

// MARK: - Properties, init() and lifecycle
final class InfoViewController: UIViewController {
    private let infoView = InfoView()
    private var viewModel: InfoViewModelProtocol?
    
    init(viewModel: InfoViewModelProtocol) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
        self.viewModel?.delegate = self
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = infoView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.viewDidLoad()
    }
}

// MARK: - InfoViewModel Delegate functionality
extension InfoViewController: InfoViewModelDelegate{
    func infoViewModelDidUpdateInformation(with information: String) {
        DispatchQueue.main.async {
            self.updateUI(with: information)
        }
    }
}

// MARK: - Update view label
private extension InfoViewController {
    func updateUI(with data: String) {
        infoView.configureInfo(with: data)
    }
}
