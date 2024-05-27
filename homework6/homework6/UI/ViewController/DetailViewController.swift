import UIKit

class DetailViewController: UIViewController {
    private let detailView = DetailView()

    override func loadView() {
        view = detailView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
