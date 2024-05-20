import Foundation

protocol DetailViewProtocol: AnyObject {
    func displayDogImage(named imageName: String)
    func displayBreedName(_ name: String)
    func displayShortDescription(_ description: String)
}


final class DetailPresenter {
    weak var view: DetailViewProtocol?
    var dogData: DogListData?
    
    init(view: DetailViewProtocol, dogData: DogListData?) {
        self.view = view
        self.dogData = dogData
    }
    
    func attachView(_ view: DetailViewProtocol) {
        self.view = view
    }
    
    func viewDidLoad() {
        guard let dogData = dogData else {
            return
        }
        view?.displayDogImage(named: dogData.dogImage)
        view?.displayBreedName(dogData.breedName)
        view?.displayShortDescription(dogData.shortDescription)
    }
}
