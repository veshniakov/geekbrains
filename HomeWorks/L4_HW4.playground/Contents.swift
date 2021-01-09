import UIKit
enum Vendor {
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
enum EngineType {
    case Diesel, Gasoline
}
enum BackState: String {
    case up = "кузов опрокинут"
    case down = "кузов опущен"
}
enum SportMode {
    case standart, sport
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
    var backState = BackState
    init(vendor: Vendor, yearMake: Int, engineType: EngineType, enginePower: Int, egineStatus: Engine, windowsStatus: Windows, backState: BackState){
        self.backState = backState
    }
    super.init(vendor: Vendor, yearMake: Int, engineType: EngineType, enginePower: Int, egineStatus: Engine, windowsStatus: Windows)
    
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
    var transsmissionMode = SportMode
    init(vendor: Vendor, yearMake: Int, engineType: EngineType, enginePower: Int, egineStatus: Engine, windowsStatus: Windows, transsmissionMode: SportMode ) {
        self.transsmissionMode = transsmissionMode
    }
    super.init(vendor: Vendor, yearMake: Int, engineType: EngineType, enginePower: Int, egineStatus: Engine, windowsStatus: Windows)
    
    func changeTranssmissionMode(mode: SportMode){
        switch mode {
        case SportMode.standart:
            self.SportMode = .standart
        default:
            self.SportMode = .sport
        }
    }
}
