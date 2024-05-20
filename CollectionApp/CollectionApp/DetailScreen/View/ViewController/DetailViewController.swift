import UIKit

//MARK: - Properties and vc lifecycle
class DetailViewController: UIViewController {
    var presenter: DetailPresenter?
    private lazy var detailView = DetailView()
    
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.attachView(self)
        presenter?.viewDidLoad()
    }
}

extension DetailViewController: DetailViewProtocol {
    func displayDogImage(named imageName: String) {
        detailView.configureImage(with: imageName)
    }
    
    func displayBreedName(_ name: String) {
        detailView.configureBreedName(with: name)
    }
    
    func displayShortDescription(_ description: String) {
        detailView.configureDescription(with: description)
    }
    
}
