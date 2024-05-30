import Foundation

protocol DetailViewProtocol: AnyObject {
    func displayDogImage(named imageName: String)
    func displayBreedName(_ name: String)
    func displayShortDescription(_ description: String)
    func navigateToInfoView(with index: Int)
}

//MARK: - Properties and init()
final class DetailPresenter {
    private weak var view: DetailViewProtocol?
    private var dogData: DogListData?
    private var dogIndex: Int?
    
    init(dogData: DogListData?, index: Int?) {
        self.dogData = dogData
        self.dogIndex = index
    }

}

//MARK: - vc functionality
extension DetailPresenter {
    func viewDidLoad(view: DetailViewProtocol) {
        self.view = view
        guard let dogData = dogData else {
            return
        }
        view.displayDogImage(named: dogData.dogImage)
        view.displayBreedName(dogData.breedName)
        view.displayShortDescription(dogData.shortDescription)
    }
    
    func showInfoView() {
        guard let index = dogIndex else { return }
        view?.navigateToInfoView(with: index)
    }
}
