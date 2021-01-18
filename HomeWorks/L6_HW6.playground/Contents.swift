import UIKit

enum Vendor {
    case Volvo, BMW, Ferrari, Honda, Bugatti, Lamborgini, MAN, КАМАЗ
}
enum Engine: String {
    case start = "заведен"
    case stop = "выключен"
}
enum Windows: String {
    case open = "открыты"
    case close = "закрыты"
}
enum EngineType: String {
    case Diesel = "дизельный"
    case Gasoline = "бензиновый"
}
enum BackState: String {
    case up = "опрокинут"
    case down = "опущен"
}
enum SportMode: String {
    case Standart = "городской"
    case Sport = "спортивный"
}
struct Queue<T> {
    var elements: [T] = []
    
    mutating func push(_ element: T) {
        elements.append(element)
    }
    mutating func pop() -> T? {
        return elements.removeFirst()
    }
}
protocol Car {
    var vendor: Vendor { get set }
    var model: String { get set }
    var yearMake: Int { get set }
    var engineType: EngineType { get set }
    var enginePower: Int { get set }
    var egineStatus: Engine { get set }
    var windowsStatus: Windows { get set }
}

extension Car{
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
}

class SportCar: Car, CustomStringConvertible {
    var vendor: Vendor
    var model: String
    var yearMake: Int
    var engineType: EngineType
    var enginePower: Int
    var egineStatus: Engine
    var windowsStatus: Windows
    var transsmissionMode: SportMode
    var description: String {
        return String(describing: "Автомобиль: \(vendor) \(model)\nГод выпуска: \(yearMake)\nТип двигателя: \(engineType.rawValue)\nМощность двигателя: \(enginePower) л.с.\nСостояние: окна \(windowsStatus.rawValue) | двигатель: \(egineStatus.rawValue) | режим КПП: \(transsmissionMode.rawValue)\n______________\n")
    }
    init(vendor: Vendor, model: String, yearMake: Int, engineType: EngineType, enginePower: Int, egineStatus: Engine, windowsStatus: Windows, transsmissionMode: SportMode ){
        self.vendor = vendor
        self.model = model
        self.yearMake = yearMake
        self.engineType = engineType
        self.enginePower = enginePower
        self.egineStatus = egineStatus
        self.windowsStatus = windowsStatus
        self.transsmissionMode = transsmissionMode
    }
    func changeWindowsStatus(action: Windows){
        switch action {
        case Windows.close:
            self.windowsStatus = .close
        default:
            self.windowsStatus = .open
        }
    }
    func changeEngineStatus(action: Engine){
        switch action {
        case Engine.stop:
            self.egineStatus = .stop
        default:
            self.egineStatus = .start
        }
    }
    func changeTranssmissionMode(mode: SportMode){
        switch mode {
        case SportMode.Standart:
            self.transsmissionMode = .Standart
        default:
            self.transsmissionMode = .Sport
        }
    }
}
class TrunkCar: Car, CustomStringConvertible{
    var backState: BackState
    var vendor: Vendor
    var model: String
    var yearMake: Int
    var engineType: EngineType
    var enginePower: Int
    var egineStatus: Engine
    var windowsStatus: Windows
    var description: String {
        return String(describing: "Автомобиль: \(vendor) \(model)\nГод выпуска: \(yearMake)\nТип двигателя: \(engineType.rawValue)\nМощность двигателя: \(enginePower) л.с.\nСостояние: окна \(windowsStatus.rawValue) | двигатель: \(egineStatus.rawValue) | кузов: \(backState.rawValue)\n______________\n")
    }
    init(vendor: Vendor, model: String, yearMake: Int, engineType: EngineType, enginePower: Int, egineStatus: Engine, windowsStatus: Windows, backState: BackState){
        self.backState = backState
        self.vendor = vendor
        self.model = model
        self.yearMake = yearMake
        self.engineType = engineType
        self.enginePower = enginePower
        self.egineStatus = egineStatus
        self.windowsStatus = windowsStatus
    }
    
    func changeWindowsStatus(action: Windows){
        switch action {
        case Windows.close:
            self.windowsStatus = .close
        default:
            self.windowsStatus = .open
        }
    }
    func changeEngineStatus(action: Engine){
        switch action {
        case Engine.stop:
            self.egineStatus = .stop
        default:
            self.egineStatus = .start
        }
    }
    func changeBackState(action: BackState){
        switch action {
        case BackState.up:
            self.backState = .up
        default:
            self.backState = .down
        }
    }
}
var sportCar1 = SportCar(vendor: .BMW, model: "X6", yearMake: 2006, engineType: .Gasoline, enginePower: 507, egineStatus: .stop, windowsStatus: .close, transsmissionMode: .Standart)
print(sportCar1)
var sportCar2 = SportCar(vendor: .Bugatti, model: "Veyron", yearMake: 2004, engineType: .Gasoline, enginePower: 1001, egineStatus: .stop, windowsStatus: .close, transsmissionMode: .Sport)
print(sportCar2)
var trunkCar1 = TrunkCar(vendor: .Volvo, model: "FMX", yearMake: 2012, engineType: .Diesel, enginePower: 357, egineStatus: .stop, windowsStatus: .close, backState: .down)
print(trunkCar1)
var trunkCar2 = TrunkCar(vendor: .КАМАЗ, model: "43118", yearMake: 2021, engineType: .Diesel, enginePower: 300, egineStatus: .stop, windowsStatus: .close, backState: .down)
print(trunkCar2)
var queueWashingSportCar = Queue<SportCar>()
var queueWashingTrunkCar = Queue<TrunkCar>()
queueWashingSportCar.push(sportCar1)
queueWashingSportCar.push(sportCar2)
queueWashingTrunkCar.push(trunkCar1)
queueWashingTrunkCar.push(trunkCar2)
print(queueWashingSportCar.elements.reduce("Легковых машин в очереди \(queueWashingSportCar.elements.count): ") {(total, number) in total + "|\(number.vendor) \(number.model)| "})
print(queueWashingTrunkCar.elements.reduce("Грузовых машин в очереди \(queueWashingTrunkCar.elements.count): ") {(total, number) in total + "|\(number.vendor) \(number.model)| "})
queueWashingTrunkCar.pop()
print(queueWashingSportCar.elements.reduce("Легковых машин в очереди \(queueWashingSportCar.elements.count): ") {(total, number) in total + "|\(number.vendor) \(number.model)| "})
print(queueWashingTrunkCar.elements.reduce("Грузовых машин в очереди \(queueWashingTrunkCar.elements.count): ") {(total, number) in total + "|\(number.vendor) \(number.model)| "})

