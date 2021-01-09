import UIKit

enum CarMaker {
    case Volvo, BMW
}
enum Engine: String {
    case start = "заведен"
    case stop = "выключен"
}
enum Windows: String {
    case open = "закрыты"
    case close = "открыты"
}
enum EditCapacity {
    case load, unload
}

struct carSetup {
    let vendor: CarMaker
    let yearMake: Int
    let capacity: Double
    var filledCapacity: Double
    var egineStatus: Engine
    var windowsStatus: Windows
    
    mutating func changeWindowsStatus(action: Windows){
        switch action {
        case Windows.close:
            self.windowsStatus = .close
        default:
            self.windowsStatus = .open
        }
    }
    
    mutating func changeEngineStatus(action: Engine){
        switch action {
        case Engine.stop:
            self.egineStatus = .stop
        default:
            self.egineStatus = .start
        }
    }
    
    mutating func changeFilledCapacity(action: EditCapacity, volume: Double){
        switch action {
        case EditCapacity.load:
            return filledCapacity = filledCapacity + volume
        default:
            return filledCapacity = filledCapacity - volume
        }
    }
}

var sportCar = carSetup(vendor: .BMW, yearMake: 2020, capacity: 200.0, filledCapacity: 0, egineStatus: .stop, windowsStatus: .close)
var trunkCar = carSetup(vendor: .Volvo, yearMake: 1999, capacity: 2000, filledCapacity: 1500, egineStatus: .start, windowsStatus: .open)

sportCar.changeEngineStatus(action: .start)
sportCar.changeFilledCapacity(action: .load, volume: 50)
sportCar.changeWindowsStatus(action: .open)
print("Автомобиль \(sportCar.egineStatus.rawValue), окна \(sportCar.windowsStatus.rawValue), в багажнике автомобиля \(sportCar.filledCapacity) кг. из \(sportCar.capacity)")
trunkCar.changeEngineStatus(action: .stop)
trunkCar.changeFilledCapacity(action: .unload, volume: 322)
trunkCar.changeWindowsStatus(action: .close)
print("Автомобиль \(trunkCar.egineStatus.rawValue), окна \(trunkCar.windowsStatus.rawValue), в кузове автомобиля \(trunkCar.filledCapacity) кг. из \(trunkCar.capacity)")
