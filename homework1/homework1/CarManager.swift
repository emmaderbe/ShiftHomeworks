import Foundation

// MARK: - Property
class CarManager {
    private var cars = [Car]()
}

// MARK: - addCar() - ввод автомобиля в базу
extension CarManager {
    func addCar() {
        print(ConsoleMessage.stopTaskMessage.rawValue)
        
        guard let manufacturer = getInput(
            prompt: ConsoleMessage.enterManufacturer.rawValue,
            invalidPrompt: ConsoleMessage.manufacturerError.rawValue) else { return }
        
        guard let model = getInput(
            prompt: ConsoleMessage.enterModel.rawValue,
            invalidPrompt: ConsoleMessage.modelError.rawValue) else { return }
        
        var yearOfIssue: Int?
        while true {
            let yearInput = getInput(
                prompt: ConsoleMessage.enterYear.rawValue,
                invalidPrompt: ConsoleMessage.yearError.rawValue,
                isOptional: true)
            
            if let yearInput = yearInput {
                if isValidYear(yearInput) {
                    yearOfIssue = Int(yearInput)
                    break
                } else {
                    print(ConsoleMessage.yearError.rawValue)
                }
            } else {
                break
            }
        }
        
        var body: Body?
        repeat {
            guard let bodyString = getInput(
                prompt: ConsoleMessage.enterBodyType.rawValue,
                invalidPrompt: ConsoleMessage.bodyTypeError.rawValue) else { return }
            body = Body(rawValue: bodyString.lowercased().capitalized)
            if body == nil {
                print(ConsoleMessage.bodyTypeError.rawValue)
            }
        } while body == nil
        guard let bodyUnwrapped = body else { return }
        
        let carNumber = getInput(
            prompt: ConsoleMessage.enterCarNumber.rawValue,
            invalidPrompt: ConsoleMessage.enterCarNumber.rawValue,
            isOptional: true)
        
        let newCar = Car(manufacturer: manufacturer, model: model, body: bodyUnwrapped, yearOfIssue: yearOfIssue, carNumber: carNumber)
        cars.append(newCar)
        print(ConsoleMessage.succesfulCarAddition.rawValue)
    }
}

// MARK: - getAllCars() - получение списка всех автомобилей
extension CarManager {
    func getAllCars() {
        if cars.isEmpty {
            print(ConsoleMessage.emptyCarList.rawValue)
        } else {
            for (index, car) in cars.enumerated() {
                print("Автомобиль номер \(index + 1): \n\(car.description())")
            }
        }
    }
}

// MARK: - filterCarsByBody() - фильтрация списка автомобилей по типу кузова и последующий его вывод
extension CarManager {
    func filterCarsByBody() {
        var body: Body?
        while body == nil {
            let bodyInput = getInput(
                prompt: ConsoleMessage.filterByBodyType.rawValue,
                invalidPrompt: ConsoleMessage.bodyTypeError.rawValue
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

// MARK: - getInput() - вспомогательная функция для ввода автомобилей в базу
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
                    print(ConsoleMessage.emptyInput.rawValue)
                }
            default:
                return input
            }
        }
    }
}

// MARK: - isValidYear() - проверка года выпуска автомобиля
extension CarManager {
   private func isValidYear(_ year: String) -> Bool {
       guard let yearInt = Int(year), yearInt >= YearLimit.fistCarInHistoryYear.rawValue, yearInt <= YearLimit.currentYear.rawValue, year.count == YearLimit.numCount.rawValue else {
            return false
        }
        return true
    }
}
