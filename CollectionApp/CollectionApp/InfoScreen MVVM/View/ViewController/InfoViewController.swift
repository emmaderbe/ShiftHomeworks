import UIKit

class InfoViewController: UIViewController {
    private let infoView = InfoView()
    var viewModel: InfoViewModel?
    
    init(viewModel: InfoViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = infoView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.onDataUpdated = { [weak self] data in
            print("data - \(data)")
            self?.updateUI(with: data)
        }
    }
    
    private func updateUI(with data: String) {
        infoView.configureInfo(with: data)
//        if let infoData = viewModel?.infoData {
//            infoView.configureInfo(with: infoData.information)
//        }
    }
    
}
