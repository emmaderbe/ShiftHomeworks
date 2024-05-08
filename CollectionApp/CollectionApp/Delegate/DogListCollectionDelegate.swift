import UIKit

final class DogListCollectionDelegate: NSObject, UICollectionViewDelegate {
    var navigationController: UINavigationController?
    var createdData = DataSource.createData()
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        detailVC.selectedDog = createdData[indexPath.item]
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
