import Foundation

main()

// MARK: - main() - включение консольного приложения 
private func main() {
    let car = CarManager()
    var shouldQuit = false
    
    while !shouldQuit {
        print(ConsoleMessage.welcomeMessage.rawValue)
        let choice = readLine()
        
        switch choice {
        case "1":
            car.addCar()
        case "2":
            car.getAllCars()
        case "3":
            car.filterCarsByBody()
        case "4":
            shouldQuit = true
            print(ConsoleMessage.goodbyeMessage.rawValue)
        default:
            print(ConsoleMessage.invalidInput.rawValue)
        }
    }
}
