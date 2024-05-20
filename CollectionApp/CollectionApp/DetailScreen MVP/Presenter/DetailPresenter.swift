import Foundation

protocol DetailViewProtocol: AnyObject {
    func displayDogImage(named imageName: String)
    func displayBreedName(_ name: String)
    func displayShortDescription(_ description: String)
    func navigateToInfoView(with index: Int)
}


final class DetailPresenter {
    weak var view: DetailViewProtocol?
    var dogData: DogListData?
    private var dogIndex: Int?
    
    init(view: DetailViewProtocol, dogData: DogListData?, index: Int?) {
        self.view = view
        self.dogData = dogData
        self.dogIndex = index
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
    
    func showInfoView() {
        guard let index = dogIndex else { return }
        view?.navigateToInfoView(with: index)
    }
}
