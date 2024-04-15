import Foundation

class CarManager {
    private var cars = [Car]()
}

extension CarManager {
    func addCar() {
        print(ConsoleMessage.stopTaskMessage.rawValue)
        
        guard let manufacturer = getInput(
            prompt: ConsoleMessage.enterManufacturerMessage.rawValue,
            invalidPrompt: ConsoleError.manufacturerError.rawValue) else { return }
        
        guard let model = getInput(
            prompt: ConsoleMessage.enterModelMessage.rawValue,
            invalidPrompt: ConsoleError.modelError.rawValue) else { return }
        
        var yearOfIssue: Int?
        while true {
            let yearInput = getInput(
                prompt: ConsoleMessage.enterYearMessage.rawValue,
                invalidPrompt: ConsoleError.yearError.rawValue,
                isOptional: true)
            
            if let yearInput = yearInput {
                if isValidYear(yearInput) {
                    yearOfIssue = Int(yearInput)
                    break
                } else {
                    print(ConsoleError.yearError.rawValue)
                }
            } else {
                break
            }
        }
        
        var body: Body?
        repeat {
            guard let bodyString = getInput(
                prompt: ConsoleMessage.enterBodyTypeMessage.rawValue,
                invalidPrompt: ConsoleError.bodyTypeError.rawValue) else { return }
            body = Body(rawValue: bodyString.lowercased().capitalized)
            if body == nil {
                print(ConsoleError.bodyTypeError.rawValue)
            }
        } while body == nil
        guard let bodyUnwrapped = body else { return }
        
        let carNumber = getInput(
            prompt: ConsoleMessage.enterCarNumberMessage.rawValue,
            invalidPrompt: ConsoleMessage.enterCarNumberMessage.rawValue,
            isOptional: true)
        
        let newCar = Car(manufacturer: manufacturer, model: model, body: bodyUnwrapped, yearOfIssue: yearOfIssue, carNumber: carNumber)
        cars.append(newCar)
        print(ConsoleMessage.succesfulCarAdditionMessage.rawValue)
    }
}

extension CarManager {
    func getAllCars() {
        if cars.isEmpty {
            print(ConsoleError.emptyCarListError.rawValue)
        } else {
            for (index, car) in cars.enumerated() {
                print("Автомобиль номер \(index + 1): \n\(car.description())")
            }
        }
    }
}

extension CarManager {
    func filterCarsByBody() {
        var body: Body?
        while body == nil {
            let bodyInput = getInput(
                prompt: ConsoleMessage.filterByBodyTypeMessage.rawValue,
                invalidPrompt: ConsoleError.bodyTypeError.rawValue
            )
            
            if let bodyInput = bodyInput, let validatedBody = Body(rawValue: bodyInput.lowercased().capitalized) {
                body = validatedBody
            } else if bodyInput == nil {
                return
            }
        }
        
        let filteredCars = cars.filter { $0.body == body }
        if filteredCars.isEmpty {
            print("Нет автомобилей с кузовом \(body?.rawValue.lowercased() ?? "").")
        } else {
            for (index, car) in filteredCars.enumerated() {
                print("Автомобиль номер \(index + 1): \n\(car.description())")
            }
        }
    }
}

extension CarManager {
   private func getInput(prompt: String, invalidPrompt: String, isOptional: Bool = false) -> String? {
        while true {
            print("\(prompt)")
            let input = readLine()
            
            switch input?.lowercased() {
            case ConsoleMessage.stopFunctionWord.rawValue:
                return nil
            case "":
                if isOptional {
                    return nil
                } else {
                    print(ConsoleError.emptyInputError.rawValue)
                }
            default:
                return input
            }
        }
    }
}

extension CarManager {
   private func isValidYear(_ year: String) -> Bool {
       guard let yearInt = Int(year), yearInt >= YearLimit.fistCarInHistoryYear.rawValue, yearInt <= YearLimit.currentYear, year.count == YearLimit.numCount.rawValue else {
            return false
        }
        return true
    }
}
