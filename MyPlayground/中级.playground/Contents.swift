//: Playground - noun: a place where people can play

import UIKit

/******************************************* 枚举 *******************************************/
/******************************************* 枚举 *******************************************/
/******************************************* 枚举 *******************************************/
enum Month {
    case January
    case February
    case March
    case April
    case May
    case June
    case July
    case August
    case September
    case October
    case November
    case December
}

enum Season {
    case Spring, Summer, Autumn, Winter
}

let curMonth: Month = .June

func season(month: Month) -> Season {
    switch month {
    case .March, .April, .May:
        return .Spring
    case .June, .July, .August:
        return .Summer
    case .September, .October, .November:
        return .Autumn
    case .December, .January, .February:
        return .Winter
    }
}

// 原始值  raw value
enum Mon: Int {
    case January = 1
    case February = 2
    case March = 3
    case April = 4
    case May = 5
    case June = 6
    case July = 7
    case August = 8
    case September = 9
    case October = 10
    case November = 11
    case December = 12
}

func monthsBeforeNewYear(month: Mon) -> Int {
    return 12 - month.rawValue
}

let input = 5
let month = Mon(rawValue: input)
if let month = month {
    monthsBeforeNewYear(month: month)
}

// 不写 = * 默认从0开始，依次加一
enum Coin: Int {
    case Penny = 1
    case Nickel = 5
    case Dime = 10
    case Quarter = 25
}

let coin: Coin = .Quarter
print("It's \(coin.rawValue) cents")


// 不写 = "*" 默认为本身的字符串
enum ProgrammingLanguage: String {
    case Swift = "Swift"
    case ObjectiveC = "ObjectiveC"
    case C = "C"
    case Java = "Java"
}

let myFavoriteLanguage: ProgrammingLanguage = .Swift
print("\(myFavoriteLanguage) is my favorite language")



// 关联值  associate value
enum ATMStatus {
    case Success(Int)
    case Error(String)
}

var balance = 1000

func withdraw(amount: Int) -> ATMStatus {
    if balance >= amount {
        balance -= amount
        return .Success(balance)
    } else {
        return .Error("Not enough money")
    }
}

let result = withdraw(amount: 100)

switch result {
case let .Success(newBalance):
    print("\(newBalance) Yuan left in your account")
case let .Error(errorMsg):
    print("Error: \(errorMsg)")
}


enum Shape {
    case Square(side: Double)
    case Rectangle(width: Double, height: Double)
    case Circle(centerX: Double, centerY: Double, radius: Double)
    case Point
    
    func area0() -> Double {
        switch self {
        case let .Square(side):
            return side * side
        case let .Rectangle(width, height):
            return width * height
        case let .Circle(_, _, r):
            return M_PI * r * r
        case .Point:
            return 0
        }
    }
}

let square = Shape.Square(side: 10)
let rectangle = Shape.Rectangle(width: 20, height: 30)
let circle = Shape.Circle(centerX: 0, centerY: 0, radius: 15)
let point = Shape.Point

func area1(shape: Shape) -> Double {
    switch shape {
    case let .Square(side):
        return side * side
    case let .Rectangle(width, height):
        return width * height
    case let .Circle(_, _, r):
        return M_PI * r * r
    case .Point:
        return 0
    }
}

square.area0()
rectangle.area0()
circle.area0()
point.area0()
area1(shape: square)
area1(shape: rectangle)
area1(shape: circle)
area1(shape: point)

/*****************可选型是一个枚举类型*****************/
var name: Optional<String> = Optional.some("qimiao")
name = .none

name = "qimiao"
name = nil

switch name {
case .none:
    print("No name")
case let .some(name):
    print("Name is \(name)")
}

if let name = name {
    print(print("Name is \(name)"))
} else {
    print("No name")
}


// 含有递归的枚举  用关键字 indirect 
indirect enum ArithmeticExpression {
    case Number(Int)
    case Addition(ArithmeticExpression, ArithmeticExpression)
    case Multiplication(ArithmeticExpression, ArithmeticExpression)
}

// (5 + 4) * 2
let five = ArithmeticExpression.Number(5)
let four = ArithmeticExpression.Number(4)
let sum = ArithmeticExpression.Addition(five, four)
let two = ArithmeticExpression.Number(2)
let product = ArithmeticExpression.Multiplication(sum, two)

func evaluate(expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .Number(value):
        return value
    case let .Addition(left, right):
        return evaluate(expression: left) + evaluate(expression: right)
    case let .Multiplication(left, right):
        return evaluate(expression: left) * evaluate(expression: right)
    }
}

evaluate(expression: product)




/******************************************* 结构体 *******************************************/
/******************************************* 结构体 *******************************************/
/******************************************* 结构体 *******************************************/
struct Location0 {
    let latitude: Double
    let longitude: Double
}

let myLocation = Location0(latitude: 32.8782, longitude: 34.8237)
myLocation.latitude
myLocation.longitude

struct Place {
    let location: Location0
    var name: String
}

var myPlace = Place(location: myLocation, name: "qimiao")
myPlace.location.latitude
myPlace.location.longitude
myPlace.name


struct Local0 {
    var lat: Double = 0
    var lon: Double = 0
}

var loc = Local0()
var loc1 = Local0(lat: 32.8782, lon: 34.8237)

struct Local1 {
    var lat: Double
    var lon: Double
    
    init?(coordi: String) {
        guard let commaIndex = coordi.range(of: ",")?.lowerBound else {
                return nil
        }
        let first = coordi.substring(to: commaIndex)
        let second = coordi.substring(from: coordi.index(after: commaIndex))
        
        lat = Double(first) ?? 0
        lon = Double(second) ?? 0
    }
    
    func printLocation() {
        print("the location is \(lat), \(lon)")
    }
    
    func isNorth() -> Bool {
        return lat > 0
    }
}

var loc2 = Local1(coordi: "12.3985,-23.9238")
loc2?.lat
loc2?.lon
loc2?.printLocation()
loc2?.isNorth()

/*****************结构体，枚举是值类型*****************/
/*****************Array Dictionary Set Int Float Double Bool String 都是结构体*****************/

// 结构体、枚举中要修改自身需要加关键词 mutating
struct Point0 {
    var x = 0
    var y = 0
    
    mutating func goEast() {
        x += 1
    }
}
var p = Point0()
p.x
p.goEast()
p.x

enum Switch {
    case On
    case Off
    
    mutating func click() {
        switch self {
        case .On:
            self = .Off
        case .Off:
            self = .On
        }
    }
}
var btn = Switch.Off
btn.click()
btn.click()
btn.click()



/******************************************* 类 *******************************************/
/******************************************* 类 *******************************************/
/******************************************* 类 *******************************************/
class Person {
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    init?(fullName: String) {
        guard let spaceIndex = fullName.range(of: " ")?.lowerBound else {
            return nil
        }
        
        firstName = fullName.substring(to: spaceIndex)
        lastName = fullName.substring(from: fullName.index(after: spaceIndex))
    }
    
    func fullName() -> String {
        return firstName + "-" + lastName
    }
}

let person1 = Person(firstName: "qi", lastName: "miao")
person1.fullName()
let person2 = Person(fullName: "qi miao")
person2?.fullName()
let person3 = person2

/*****************类是引用类型*****************/

// 判断两个引用类型是否指向同一个地址 '===' 或 '!=='
person1 === person2
person2 === person3
person1 !== person2
person2 !== person3



// 计算型属性
struct Point {
    var x = 0.0
    var y = 0.0
}

struct Size {
    var width = 0.0
    var height = 0.0
}

class Rectangle {
    var origin = Point()
    var size = Size()
    var center: Point {
        set {
            origin.x = newValue.x - size.width / 2
            origin.y = newValue.y - size.height / 2
        }
        get {
            let centerX = origin.x + size.width / 2
            let centerY = origin.y + size.height / 2
            return Point(x: centerX, y: centerY)
        }
    }
    
    var area: Double {
        return size.width * size.height
    }
    
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
}

var rect = Rectangle(origin: Point(), size: Size(width: 10, height: 5))
rect.center
rect.center = Point()
rect.area



// 类属性
class Player {
    var name: String
    var score: UInt32 = 0
    static var highestScore: UInt32 = 0
    
    init(name: String) {
        self.name = name
    }
    
    func play() {
        let score = arc4random_uniform(100)
        print("\(name) played and got \(score) scores")
        
        self.score += score
        print("Total score of \(name) is \(self.score)")
        
        Player.highestScore = self.score > Player.highestScore ? self.score : Player.highestScore
        print("Highest score is \(Player.highestScore)")
    }
}

let player1 = Player(name: "p1")
let player2 = Player(name: "p2")

player1.play()
Player.highestScore
player1.play()
Player.highestScore
player2.play()
Player.highestScore
player2.play()
Player.highestScore


// 类型方法
struct Matrix {
    var m: [[Int]]
    var row: Int
    var col: Int
    
    init?(arr2d: [[Int]]) {
        guard arr2d.count > 0 else {
            return nil
        }
        
        let row = arr2d.count
        let col = arr2d[0].count
        for i in 1..<row {
            if arr2d[i].count != col {
                return nil
            }
        }
        self.m = arr2d
        self.row = row
        self.col = col
    }
    
    func printMatrix() {
        for i in 0..<row {
            for j in 0..<col {
                print(m[i][j], terminator: "\t")
            }
            print()
        }
    }
    
    static func identityMatrix(n: Int) -> Matrix? {
        if n <= 0 {
            return nil
        }
        var arr2d:[[Int]] = []
        for i in 0..<n {
            var row = [Int](repeatElement(0, count: n))
            row[i] = 1
            arr2d.append(row)
        }
        return Matrix(arr2d: arr2d)
    }
}

if let m = Matrix(arr2d: [[1, 2], [3, 4]]) {
    m.printMatrix()
}
if let ma = Matrix.identityMatrix(n: 5) {
    ma.printMatrix()
}


// 属性观察器
class LightBulb {
    static let maxCurrent = 30
    var current = 0 {
        willSet {
            print("Current value changed, The change is \(abs(current - newValue))")
        }
        didSet {
            if current == LightBulb.maxCurrent {
                print("Pay attention, the current value get to the maximum point.")
            } else if current > LightBulb.maxCurrent {
                print("Current too high, falling back to previous setting.")
                current = oldValue
            } else {
                print("The current is \(current)")
            }
            
        }
    }
}

let bulb = LightBulb()
bulb.current = 20
bulb.current = 30
bulb.current = 40

// 属性观察器不会再初始化的时候调用
enum Theme {
    case DayMode
    case NightMode
}
class UI {
    var fontColor: UIColor!
    var backgroundColor: UIColor!
    var themeMode: Theme = .DayMode {
        didSet {
            changeTheme(theme: themeMode)
        }
    }
    
    init(themeMode: Theme) {
        self.themeMode = themeMode
        changeTheme(theme: themeMode)
    }
    
    func changeTheme(theme: Theme) {
        switch themeMode {
        case .DayMode:
            fontColor = UIColor.black
            backgroundColor = UIColor.white
        case .NightMode:
            fontColor = UIColor.white
            backgroundColor = UIColor.black
        }
    }
}

let ui = UI(themeMode: .DayMode)
ui.themeMode
ui.fontColor
ui.backgroundColor

ui.themeMode = .NightMode
ui.fontColor
ui.backgroundColor


// 懒加载
class ClosedRange {
    let start: Int
    let end: Int
    var width: Int {
        return end - start + 1
    }
    lazy var sum: Int = {
        print("start computing sum value")
        var res = 0
        for i in self.start...self.end {
            res += i
        }
        return res
    }()
    
    init?(start: Int, end: Int) {
        if start > end {
            return nil
        }
        self.start = start
        self.end = end
    }
}

if let range = ClosedRange(start: 0, end: 10_000) {
    range.width
    range.sum
    range.sum
    range.sum
}

// 懒加载适用情况
class Location {
    let latitude: Double
    let longitude: Double
    lazy var address: String? = {
        // do it
        return nil
    }()
    
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

class Book {
    let name: String
    lazy var content: String? = {
        // do it
        return nil
    }()
    
    init(name: String) {
        self.name = name
    }
}

class Web {
    let url: String
    lazy var html: String? = {
        // do it
        return nil
    }()
    
    init(url: String) {
        self.url = url
    }
}


// 单例
class GameManager {
    var score = 0
    static let shared = GameManager()
    
    private init() {
        
    }
    
    func addScore() {
        score += 10
    }
}


// 类的两段式构造
class Humen {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Student: Humen {
    var classLevel: String
    
    init(name: String, classLevel: String) {
        // 构造初值
        self.classLevel = classLevel
        super.init(name: name)
        
        // 可以使用 self 进行逻辑操作
        if classLevel == "" {
            self.name = "I'm not level"
            print("level can not empty")
        }
    }
}

let stu = Student(name: "qimiao", classLevel: "")
stu.name

// 如果子类没有实现了任何父类的指定构造函数，则自动继承父类的所有指定构造函数
// 如果子类实现了父类所有的指定构造函数，则自动继承父类的所有便利构造函数



// 文档注释 --- Mark Down 语法
class Something {
    init() {
        
    }
}

/**
 # 快乐撒的结果
 ## 爱是快乐的价格
 卡洛斯给大家
 
 阿萨垃圾蛋糕
 
 - 拉傲视老大哥
 - 阿拉斯加大概
 - 爱拉克丝见到过
 - 登陆**老地方**看过asdg*sjd*asdg大富科技大公鸡
 - 阿斯利康结果[点我试试](www.baidu.com)
 
 1. 龙卷风上拉
 2. 圣诞快乐价格
 3. 沙路口的结果
 
 ```
 let a = "Hello"
 let b = "Swift"
 print(a + "," + b)
 ```
 */
func showMultilineComments() -> String {
    let text = "You can use the /** ... */ for multiline comments"
    return text
}

2^3
pow(2, 3)


// 扩展   extension
/*
 1.结构体在扩展中想改变自身，需要加上mutating关键字；
 2.扩展类属性，只能扩展计算型属性，不能扩展存储型属性；
 3.扩展类构造函数，只能是便利构造函数（调用指定构造函数）；
 4.扩展中，书写辅助内容，核心元素需定义在源类里；
 */


// 3.0后，循环只能用 for ... in
for i in stride(from: 2, to: 8, by: 2) {
    print(i)
}
for i in stride(from: 2, through: 8, by: 2) {
    print(i)
}



// 泛型
func swapTwoThings<T>(a: inout T, b: inout T) {
    (a, b) = (b, a)
}

var haha = "haha"
var hehe = "hehe"
swapTwoThings(a: &haha, b: &hehe)
haha
hehe

var a = 2
var b = 3
swapTwoThings(a: &a, b: &b)
a
b




/// 协议
protocol Pet1 {
    
    var name: String {get set}
    var birthPlace: String{get}
    
    func playWith()
    func fed(food: String)
    
    mutating func changeName(name: String)
}

struct Dog1: Pet1 {
    
    var name: String = "Puppy"
    let birthPlace: String = "Beijing"
    
    func playWith() {
        print("Wong")
    }
    
    func fed(food: String) {
        if food == "Bone" {
            print("Happy")
        } else {
            print("I want a bone")
        }
    }
    
    mutating func changeName(name: String) {
        self.name = name
    }
}

let myDog1: Dog1 = Dog1()
let aPet1: Pet1 = myDog1


protocol Pet2: class {
    
    var name: String {get set}
    var birthPlace: String{get}
    
    func playWith()
    func fed(food: String)
    
    func changeName(name: String)
}

class Dog2: Pet2 {
    
    var name: String = "Puppy"
    let birthPlace: String = "Beijing"
    
    func playWith() {
        print("Wong")
    }
    
    func fed(food: String) {
        if food == "Bone" {
            print("Happy")
        } else {
            print("I want a bone")
        }
    }
    
    func changeName(name: String) {
        self.name = name
    }
}

let myDog2: Dog2 = Dog2()
let aPet2: Pet2 = myDog2


/// 类不能被继承关键字 final
final class Catt {
    
}

//class superCat: Cat {
//    
//}


/// 类中某个方法所有子类必须实现关键字 required




/// 协议的灵活使用例子
protocol Pet {
    var name: String {set get}
}

protocol Flyable {
    var flySpeed: Double {get}
    var flyHeight: Double {get}
}

class Animal {
}

class Dog: Animal, Pet {
    var name = "Puppy"
}

class Cat: Animal, Pet {
    var name = "Kitten"
}

class Bird: Animal, Flyable {
    var flySpeed: Double
    var flyHeight: Double
    
    init(flySpeed: Double, flyHeight: Double) {
        self.flySpeed = flySpeed
        self.flyHeight = flyHeight
    }
}

class Parrot: Bird, Pet {
    var name: String
    
    init(name: String, flySpeed: Double, flyHeight: Double) {
        self.name = name + "===" + name
        super.init(flySpeed: flySpeed, flyHeight: flyHeight)
    }
}

class Sparrow: Bird {
    var color = UIColor.gray
}

class Vehicle {
    
}

class Plane: Vehicle, Flyable {
    var model: String
    var flySpeed: Double
    var flyHeight: Double
    
    init(model: String, flySpeed: Double, flyHeight: Double) {
        self.model = model
        self.flySpeed = flySpeed
        self.flyHeight = flyHeight
    }
}


var dog = Dog()
var cat = Cat()
var parrot = Parrot(name: "hello", flySpeed: 10.0, flyHeight: 100.0)

let pets: [Pet] = [dog, cat, parrot]
for pet in pets {
    print(pet.name)
}


var sparrow = Sparrow(flySpeed: 15.0, flyHeight: 150.0)
var plane = Plane(model: "Boeing 747", flySpeed: 200.0, flyHeight: 20000.0)

let flyers: [Flyable] = [parrot, sparrow, plane]
for flyer in flyers {
    print("fly speed: \(flyer.flySpeed)---fly height: \(flyer.flyHeight)")
}





/// 给类型起别名关键字 typealias     在协议中使用 associatedtype
typealias Length = Double

extension Double {
    var km: Length { return self * 1000.0 }
    var m: Length { return self }
    var cm: Length { return self / 100 }
    var ft: Length { return self / 3.28084 }
}

let runningDistance: Length = 3.54.km


protocol WeightCalculable {
    associatedtype WeightType
    
    var weight: WeightType {get}
}

class iPhone7: WeightCalculable {
    typealias WeightType = Double

    var weight: WeightType { return 0.114 }
}

class Ship: WeightCalculable {
    typealias WeightType = Int
    
    let weight: WeightType
    
    init(weight: Int) {
        self.weight = weight
    }
}
extension Int {
    typealias Weight = Int
    var t: Weight { return 1_000 * self }
}
let titanic = Ship(weight: 46_328.t)





/// swift 标准库中的常用协议
struct Record0: Equatable, Comparable, CustomStringConvertible {
    
    var wins: Int
    var losses: Int
    
    var description: String {
        return "wins: " + String(wins) + ", losses: " + String(losses)
    }
}

func ==(left: Record0, right: Record0) -> Bool {
    return left.wins == right.wins && left.losses == right.losses
}

func <(left: Record0, right: Record0) -> Bool {
    if left.wins != right.wins {
        return left.wins < right.wins
    } else {
        return left.losses > right.losses
    }
}

let record1 = Record0(wins: 10, losses: 5)
let record2 = Record0(wins: 10, losses: 5)
record1 == record2
record1 != record2
record1 > record2
record1 >= record2
print(record1)


/// 协议的扩展，可以在扩展中进行默认的实现，超级酷
protocol Record: CustomStringConvertible {
    
    var wins: Int {get}
    var losses: Int {get}
    
    func winningPercent() -> Double
}

extension Record {
    var description: String {
        return "wins: " + String(wins) + ", losses: " + String(losses)
    }
    
    var gamePlayed: Int {
        return wins + losses
    }
    
    func shoutWins() {
        print("we win", wins, "times!")
    }
}

struct BasketballRecord: Record {
    var wins: Int
    var losses: Int
    
    func winningPercent() -> Double {
        return Double(wins) / Double(gamePlayed)
    }
}

struct BaseballRecord: Record {
    var wins: Int
    var losses: Int
    let gamePlayed: Int = 99
    
    func winningPercent() -> Double {
        return Double(wins) / Double(gamePlayed)
    }
}

print("=====================================================")
let teamRecord = BasketballRecord(wins: 2, losses: 5)
print(teamRecord)
teamRecord.shoutWins()
teamRecord.gamePlayed
let baseball = BaseballRecord(wins: 2, losses: 5)
baseball.gamePlayed


///// swift 面向协议编程


//// 弱引用        weak        unowned











