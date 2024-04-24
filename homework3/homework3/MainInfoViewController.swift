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
    
    let mainViewStruct = MainViewStruct(name: "Эмма Дербе", age: "24", education: "Экономист", location: "Краснодар")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

extension MainInfoViewController {
    func setupView() {
        backgroundView.layer.cornerRadius = 16
        
        mainPortret.layer.cornerRadius = mainPortret.frame.height / 2
        mainPortret.layer.borderWidth = 5
        mainPortret.layer.borderColor = UIColor.white.cgColor
        
        educationTitleLabel.text = MainViewEnum.educationTitleLabel.rawValue
        locationTitleLabel.text = MainViewEnum.locationTitleLabel.rawValue
        
        nameLabel.text = mainViewStruct.name + ","
        ageLabel.text = mainViewStruct.age
        educationLabel.text = mainViewStruct.education
        locationLabel.text = mainViewStruct.location
    }
}
