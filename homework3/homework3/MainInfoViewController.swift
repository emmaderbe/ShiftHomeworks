import UIKit

class MainInfoViewController: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var mainPortret: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var educationTitleLabel: UILabel!
    @IBOutlet weak var educationLabel: UILabel!
    
    @IBOutlet weak var locationTitleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    private let mainViewStruct = MainViewStruct(name: "Эмма Дербе", age: "24", education: "Экономист", location: "Краснодар", photo: "mainPortret")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

private extension MainInfoViewController {
    func setupView() {
        view.backgroundColor = .accentBackground
        backgroundView.layer.cornerRadius = 16
        setupPhoto()
        setupText()
    }
}

private extension MainInfoViewController {
    func setupPhoto() {
        mainPortret.image = UIImage(named: mainViewStruct.photo)
        mainPortret.layer.cornerRadius = mainPortret.frame.height / 2
        mainPortret.layer.borderWidth = 5
        mainPortret.layer.borderColor = UIColor.white.cgColor
    }
}

private extension MainInfoViewController {
    func setupText() {
        educationTitleLabel.text = MainViewEnum.InterfaceText.educationTitleLabel
        locationTitleLabel.text = MainViewEnum.InterfaceText.locationTitleLabel
        
        nameLabel.text = mainViewStruct.name + ","
        ageLabel.text = mainViewStruct.age
        educationLabel.text = mainViewStruct.education
        locationLabel.text = mainViewStruct.location
    }
}
