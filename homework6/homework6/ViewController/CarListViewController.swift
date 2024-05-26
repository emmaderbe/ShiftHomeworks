import UIKit

class CarListViewController: UIViewController {
    private let carListView = CarListView()
    
    override func loadView() {
       view = carListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

