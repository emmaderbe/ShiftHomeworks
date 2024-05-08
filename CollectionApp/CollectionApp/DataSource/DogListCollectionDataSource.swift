import Foundation

import UIKit

//MARK: - Property
final class DogListCollectionDataSource: NSObject, UICollectionViewDataSource {
    private lazy var createdData = DataSource.shared
}

//MARK: - numberOfItemsInSection
extension DogListCollectionDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        createdData.dogListData.count
    }
}

//MARK: - cellForItemAt
extension DogListCollectionDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DogListCollectionViewCell.identifier, for: indexPath) as? DogListCollectionViewCell
        else { return UICollectionViewCell() }
        
        let dogData = createdData.dogListData[indexPath.item]
        cell.configure(with: dogData)
        
        return cell
    }
}
