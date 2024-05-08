import UIKit

class DetailViewController: UIViewController {
    var selectedDog: DogListData?
    private lazy var detailView = DetailView()
    
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        
        if let selectedDog = selectedDog {
            detailView.configure(with: selectedDog)
        }
    }
}
