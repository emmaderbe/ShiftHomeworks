import Foundation

class DogListData {
    let dogImage: String
    let breedName: String
    let shortDescription: String
    let fullDescription: String
    
    init(dogImage: String, breedName: String, shortDescription: String, fullDescription: String) {
        self.dogImage = dogImage
        self.breedName = breedName
        self.shortDescription = shortDescription
        self.fullDescription = fullDescription
    }
}
