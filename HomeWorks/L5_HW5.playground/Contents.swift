import UIKit

enum Vendor {
    case Volvo, BMW
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

protocol ConsolePrintable: CustomStringConvertible{
    func printDescription()
}

extension ConsolePrintable{
    func printDescription() {
        print(description)
    }
}

protocol Car {
    var vendor: Vendor { get set }
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

class SportCar: Car, ConsolePrintable {
    var vendor: Vendor
    var yearMake: Int
    var engineType: EngineType
    var enginePower: Int
    var egineStatus: Engine
    var windowsStatus: Windows
    var transsmissionMode: SportMode
    var description: String {
        return String(describing: "Марка автомобиля: \(vendor)\nГод выпуска: \(yearMake)\nТип двигателя: \(engineType.rawValue)\nМощность двигателя: \(enginePower) л.с.\nСостояние: окна \(windowsStatus.rawValue) | двигатель: \(egineStatus.rawValue) | режим КПП: \(transsmissionMode.rawValue)\n______________\n")
        }
    init(vendor: Vendor, yearMake: Int, engineType: EngineType, enginePower: Int, egineStatus: Engine, windowsStatus: Windows, transsmissionMode: SportMode ){
        self.vendor = vendor
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
class TrunkCar: Car, ConsolePrintable{
    var backState: BackState
    var vendor: Vendor
    var yearMake: Int
    var engineType: EngineType
    var enginePower: Int
    var egineStatus: Engine
    var windowsStatus: Windows
    var description: String {
        return String(describing: "Марка автомобиля: \(vendor)\nГод выпуска: \(yearMake)\nТип двигателя: \(engineType.rawValue)\nМощность двигателя: \(enginePower) л.с.\nСостояние: окна \(windowsStatus.rawValue) | двигатель: \(egineStatus.rawValue) | кузов: \(backState.rawValue)\n______________\n")
        }
    init(vendor: Vendor, yearMake: Int, engineType: EngineType, enginePower: Int, egineStatus: Engine, windowsStatus: Windows, backState: BackState){
        self.backState = backState
        self.vendor = vendor
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
var bmwM6 = SportCar(vendor: .BMW, yearMake: 2006, engineType: .Gasoline, enginePower: 507, egineStatus: .stop, windowsStatus: .close, transsmissionMode: .Standart)
bmwM6.printDescription()
bmwM6.changeEngineStatus(action: .start)
bmwM6.changeWindowsStatus(action: .open)
bmwM6.changeTranssmissionMode(mode: .Sport)
bmwM6.printDescription()
var volvoFMX = TrunkCar(vendor: .Volvo, yearMake: 2012, engineType: .Diesel, enginePower: 357, egineStatus: .stop, windowsStatus: .close, backState: .down)
volvoFMX.printDescription()
volvoFMX.changeBackState(action: .up)
volvoFMX.changeEngineStatus(action: .start)
volvoFMX.printDescription()
