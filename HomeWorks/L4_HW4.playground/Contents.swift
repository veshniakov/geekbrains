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
enum SportMode {
    case Standart, Sport
}


class Car{
    let vendor: Vendor
    let yearMake: Int
    let engineType: EngineType
    let enginePower: Int
    var egineStatus: Engine
    var windowsStatus: Windows
    
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
    
    init(vendor: Vendor, yearMake: Int, engineType: EngineType, enginePower: Int, egineStatus: Engine, windowsStatus: Windows) {
        self.vendor = vendor
        self.yearMake = yearMake
        self.engineType = engineType
        self.enginePower = enginePower
        self.egineStatus = egineStatus
        self.windowsStatus = windowsStatus
    }
}

class TrunkCar: Car{
    var backState: BackState
    init(vendor: Vendor, yearMake: Int, engineType: EngineType, enginePower: Int, egineStatus: Engine, windowsStatus: Windows, backState: BackState){
        self.backState = backState
        super.init(vendor: vendor, yearMake: yearMake, engineType: engineType, enginePower: enginePower, egineStatus: egineStatus, windowsStatus: windowsStatus)
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

class SportCar: Car {
    var transsmissionMode: SportMode
    init(vendor: Vendor, yearMake: Int, engineType: EngineType, enginePower: Int, egineStatus: Engine, windowsStatus: Windows, transsmissionMode: SportMode ) {
        self.transsmissionMode = transsmissionMode
        super.init(vendor: vendor, yearMake: yearMake, engineType: engineType, enginePower: enginePower, egineStatus: egineStatus, windowsStatus: windowsStatus)
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
var bmwM6 = SportCar(vendor: .BMW, yearMake: 2006, engineType: .Gasoline, enginePower: 507, egineStatus: .stop, windowsStatus: .close, transsmissionMode: .Standart)
print("Автомобиль \(bmwM6.egineStatus.rawValue), окна \(bmwM6.windowsStatus.rawValue), коробка передач в режиме \(bmwM6.transsmissionMode). Автомобиль имеет \(bmwM6.engineType.rawValue) двигатель, мощностью \(bmwM6.enginePower) л.с.")
bmwM6.changeEngineStatus(action: .start)
bmwM6.changeWindowsStatus(action: .open)
bmwM6.changeTranssmissionMode(mode: .Sport)
print("Автомобиль \(bmwM6.egineStatus.rawValue), окна \(bmwM6.windowsStatus.rawValue), коробка передач в режиме \(bmwM6.transsmissionMode). Автомобиль имеет \(bmwM6.engineType.rawValue) двигатель, мощностью \(bmwM6.enginePower) л.с.")
var volvoFMX = TrunkCar(vendor: .Volvo, yearMake: 2012, engineType: .Diesel, enginePower: 357, egineStatus: .stop, windowsStatus: .close, backState: .down)
print("Грузовик \(volvoFMX.vendor) готов к работе. Двигатель \(volvoFMX.egineStatus.rawValue), кузов \(volvoFMX.backState.rawValue).")
volvoFMX.changeBackState(action: .up)
volvoFMX.changeEngineStatus(action: .start)
print("Разгрузка окончена. Двигатель \(volvoFMX.egineStatus.rawValue), кузов \(volvoFMX.backState.rawValue).")
