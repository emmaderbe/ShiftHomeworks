import Foundation

import UIKit

final class DogListCollectionDataSource: NSObject, UICollectionViewDataSource {
    var createdData = DataSource.createData()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        DataSource.createData().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DogListCollectionViewCell.identifier, for: indexPath) as? DogListCollectionViewCell
        else { return UICollectionViewCell() }
        
        cell.configure(with: createdData[indexPath.item])
        
        return cell
    }
}
