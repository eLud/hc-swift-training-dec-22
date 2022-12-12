
// #Syntaxe
// Variables & constantes

let firstName: String = "Ludovic"
var age: Int = 36
var height: Double = 1.73

age = 37
//firstName = "Paul" // Cannot assign to value: 'firstName' is a 'let' constant

// Typage fort

// height = age // Cannot assign value of type 'Int' to type 'Double'
// age = height // Cannot assign value of type 'Double' to type 'Int'

//height = Double(age) // 36.00000
//age = Int(height) // 1

let a: Int = 5
let b: Int = 2

let c: Int = a / b

// 1: Compile pas       ||
// 2: Compile, = 2.5
// 3: Compile, = 2      |

let a2: Double = 5.0
let b2: Int = 2

//let c2: Int = a2 / b2 // Cannot convert value of type 'Double' to expected argument type 'Int'
let c2: Double = a2 / Double(b2)

// 1: Compile pas       |||
// 2: Compile, = 2.5
// 3: Compile, = 2

// Inférence du type

let myVar = 5       // Int
var name = "Robert" // String
let version = 5.7   // Double
let char: Character = "F"      // Character

var truc: String
//print(truc) // Variable 'truc' used before being initialized
truc = "Truc"
print(truc)

let distance: Float = 3.65
var vitesse = 20.0

let temps = distance / 20.0

// 1: Compile pas      |||
// 2: Compile, = 0.1825 |
// 3: Compile, = 1
