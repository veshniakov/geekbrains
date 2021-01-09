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
