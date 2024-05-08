import UIKit

//MARK: - Properties
class DogListViewController: UIViewController {
    let dataSource = DogListCollectionDataSource()
    let delegate = DogListCollectionDelegate()
    
    private lazy var contentView: DogListCollectionView = {
        let view = DogListCollectionView()
        view.setDataSource(dataSource)
        view.setDelegates(delegate)
        return view
    }()
    
//MARK: - vc lifecycle
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        delegate.navigationController = navigationController
    }
}

