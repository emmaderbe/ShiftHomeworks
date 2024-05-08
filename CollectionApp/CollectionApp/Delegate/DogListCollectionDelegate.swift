import UIKit

//MARK: - Properties
final class DogListCollectionDelegate: NSObject, UICollectionViewDelegate {
    var navigationController: UINavigationController?
    private lazy var createdData = DataSource.shared
    }

//MARK: - didSelectItemAt
extension DogListCollectionDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        detailVC.selectedDog = createdData.dogListData[indexPath.item]
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
