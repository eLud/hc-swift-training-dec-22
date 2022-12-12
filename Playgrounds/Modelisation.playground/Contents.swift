enum CompassPoint {
    case north
    case south
    case east
    case west
}

struct City {

    let name: String
    var numberOfInhanbitants: Int
    var area: Double
    let isMajorCity: Bool
    let region: CompassPoint
}

class Town {

    let name: String
    var numberOfInhanbitants: Int
    var area: Double
    let isMajorCity: Bool

//    convenience init(name: String, isMajor: Bool) {
//        self.init(name: name, isMajor: isMajor, number: 0, area: 0)
//    }

    init(name: String, isMajor: Bool, number: Int = 0, area: Double = 0) {
        self.name = name
        self.isMajorCity = isMajor
        self.numberOfInhanbitants = number
        self.area = area
    }
}

class AnotherClass: Town {


}


// Memberwise init
let paris = City(name: "Paris", numberOfInhanbitants: 2_000_000, area: 6326.3, isMajorCity: true, region: .north)

let anotherCity = Town(name: "Lille", isMajor: false)
anotherCity.numberOfInhanbitants = 100
//anotherCity.name = "Lille"
let lille = Town(name: "Lille", isMajor: false, number: 100)

var paris2 = City(name: "Paris", numberOfInhanbitants: 2_000_000, area: 545.3, isMajorCity: true)
var newParis = paris2
newParis.numberOfInhanbitants = 1_000_000

var lyon = Town(name: "Lyon", isMajor: false, number: 500_000, area: 567.4)
var newLyon = lyon
newLyon.numberOfInhanbitants = 1_000_000

//paris2 : 2_000_000
paris2.numberOfInhanbitants
//newParis : 1_000_000
newParis.numberOfInhanbitants

//lyon : 1_000_000
lyon.numberOfInhanbitants
//newLyon : 1_000_000
newLyon.numberOfInhanbitants
