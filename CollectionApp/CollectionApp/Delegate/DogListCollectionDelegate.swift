import UIKit

protocol DogSelectionDelegate: AnyObject {
    func dogSelected(_ dog: DogListData)
}

//MARK: - Properties
final class DogListCollectionDelegate: NSObject, UICollectionViewDelegate {
    private lazy var createdData = DataSource.shared
    weak var delegate: DogSelectionDelegate?
    }

//MARK: - didSelectItemAt
extension DogListCollectionDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedDog = createdData.dogListData[indexPath.item]
        delegate?.dogSelected(selectedDog)
    }
}
