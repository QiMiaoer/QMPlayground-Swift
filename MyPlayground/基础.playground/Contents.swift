//: Playground - noun: a place where people can play

import Foundation

let num1 = 100_000_000
let num2 = 1_0000_0000

/// 字符串
var str0 = "Hello, playground"

str0.isEmpty

str0.hasPrefix("Hello")
str0.hasSuffix("playground")

str0.capitalized
str0

str0.uppercased()
str0
str0.lowercased()
str0


var str1 = "    !hi!!!!!    "

str1.trimmingCharacters(in: CharacterSet.whitespaces)
str1.trimmingCharacters(in: CharacterSet(charactersIn: " !"))


var str2 = "welcome to play swift ha-ha-ha!"

str2.components(separatedBy: " ")
str2.components(separatedBy: CharacterSet(charactersIn: " !-"))


var str3 = "-"
var array = ["a", "b", "c"]

array.joined(separator: str3)


// range
var str4 = "Welcome to Play Swift! Step by Step learn Swift language from now!"

str4.range(of: "Step")
str4.range(of: "Step", options: .backwards)
str4.range(of: "welcome", options: .caseInsensitive)

str4.startIndex
str4.endIndex
let strRange = Range<String.Index>(str4.startIndex..<str4.endIndex)

let startIndex = str4.startIndex
let endIndex = str4.index(startIndex, offsetBy: 30)
let searchRange = Range<String.Index>(startIndex..<endIndex)
str4.range(of: "step", options: .caseInsensitive, range: searchRange)

var toIndex = str4.index(str4.startIndex, offsetBy: 5)
str4.substring(to: toIndex)

var fromIndex = str4.index(str4.startIndex, offsetBy: 15)
str4.substring(from: fromIndex)

str4.substring(with: Range<String.Index>(toIndex..<fromIndex))

var insertIndex = str4.index(str4.startIndex, offsetBy: 10)
str4.insert("$", at: insertIndex)

str4.remove(at: insertIndex)
str4
str4.removeSubrange(Range<String.Index>(str4.startIndex..<insertIndex))
str4

var replaceEndIndex = str4.index(str4.startIndex, offsetBy: 12)
str4.replacingCharacters(in: Range<String.Index>(str4.startIndex..<replaceEndIndex), with: "qimiao")





/// 数组&字典&集合
// 数组
var arr0 = ["a", "b", "c"]
var arr1: [String] = ["a", "b", "c"]
var arr2: Array<String> = ["a", "b", "c"]

var arr3 = [String]()
var arr4 = Array<String>()
var arr5: Array<String> = []

arr0.append("d")
arr3.append("e")

var arr6 = arr0 + arr3

arr6.count
arr6.isEmpty

arr6.append("f")
arr6 += ["g"]
arr6 += ["h", "i", "j"]

arr6.insert("haha", at: 0)

arr6.remove(at: 0)
arr6

arr6.removeLast()
arr6

arr6[0] = "aa"
arr6

arr6[1...3] = ["bb", "cc", "dd"]
arr6
arr6[1...3] = ["bb"]
arr6
arr6[1..<2] = ["bb", "cc", "dd"]
arr6

for (index, item) in arr6.enumerated() {
    print("\(index) --- \(item)")
}


// 字典
var course0 = [1: "math", 2: "english", 3: "chinese"]
var course1: [Int: String] = [1: "math", 2: "english", 3: "chinese"]
var course2: Dictionary<Int, String> = [1: "math", 2: "english", 3: "chinese"]
var person0 = ["name": "qimiao", "hobby": "code", "nickname": "hahaha"]
var person1: [String: String] = ["name": "qimiao", "hobby": "code", "nickname": "hahaha"]
var person2: Dictionary<String, String> = ["name": "qimiao", "hobby": "code", "nickname": "hahaha"]

var dict0 = [Int: String]()
var dict1 = Dictionary<Int,String>()

person0 = [:]
person1 = [String: String]()
person2 = Dictionary<String, String>()

course0.count
course0.isEmpty

course0[1]
course0[5]
course0[5] = "hahaha"
course0
course0.updateValue("qimiao", forKey: 2)
course0
course0.removeValue(forKey: 5)
course0

for (key, value) in course0 {
    print("\(key): \(value)")
}

course0.keys
course0.values


// 集合
var set0 = Set<Int>()
set0.insert(1)
set0.insert(2)
set0.insert(3)
set0

var set1: Set<Int> = [2, 3, 4]
var set2 = Set<Int>([3, 4])

set0.count
set0.isEmpty
set0.max()
set0.min()
set0
set0.insert(4)
set0
set0.insert(3)
set0
set0.contains(3)
set0.insert(100)
set0
set0.remove(100)
set0
set0.remove(50)
set0

for set in set0 {
    print(set)
}
set0.remove(4)
set0
set1
set0.intersection(set1)             // 交集
set0.union(set1)                    // 并集
set0.subtract(set1)                 // 集合减法
set0.symmetricDifference(set1)      // 补集

set0
set2
set0.isSubset(of: set2)             // 子集
set0.isSuperset(of: set2)           // 超集
set0.isStrictSubset(of: set2)       // 真子集
set0.isStrictSuperset(of: set2)     // 真超集
set0.isDisjoint(with: set2)         // 相离


/*================================================================================================================*/
/*================================================================================================================*/
/*================================================================================================================*/



import UIKit

let colors = ["Air Force Blue": (red: 93, green: 138, blue: 168),
              "Bittersweet": (red: 254, green: 111, blue: 94),
              "Canary Yellow": (red: 255, green: 239, blue: 0),
              "Dark Orange": (red: 255, green: 140, blue: 0),
              "Electric Violet": (red: 143, green: 0, blue: 255),
              "Fern": (red: 113, green: 188, blue: 120),
              "Gamboge": (red: 228, green: 155, blue: 15),
              "Hollywood Cerise": (red: 244, green: 0, blue: 161),
              "Icterine": (red: 252, green: 247, blue: 94),
              "Jazzberry Jam": (red: 165, green: 11, blue: 94)
             ]

var backView = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: colors.count * 50))
backView.backgroundColor = UIColor.black

var index = 0
for (colorName, rgbTuple) in colors {
    var colorStripe = UILabel(frame: CGRect(x: 0, y: CGFloat(index * 50 + 5), width: 320, height: 40))
    colorStripe.backgroundColor = UIColor(red: CGFloat(rgbTuple.red) / 255.0, green: CGFloat(rgbTuple.green) / 255.0, blue: CGFloat(rgbTuple.blue) / 255.0, alpha: 1.0)
    
    var colorNameLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
    colorNameLabel.font = UIFont(name: "Arial", size: 25)
    colorNameLabel.textColor = UIColor.black
    colorNameLabel.textAlignment = .right
    colorNameLabel.text = colorName
    
    colorStripe.addSubview(colorNameLabel)
    backView.addSubview(colorStripe)
    index += 1
}
backView


/// switch
var score = 90

switch score {
case 0:
    print("You got an egg!")
case 1..<60:
    print("Sorry, you failed")
case 60:
    print("Just passed")
case 61..<70:
    print("Just so-so")
case 70..<80:
    print("Not bad")
case 80..<90:
    print("Good job")
case 90..<100:
    print("Great")
case 100:
    print("Perfect")
default:
    print("Something wrong with your score")
}


var coordinate = (1, 1)

switch coordinate {
case (0, 0):
    print("原点")
case (1, 0):
    print("在 x 轴正方向上")
case (-1, 0):
    print("在 x 轴负方向上")
case (0, 1):
    print("在 y 轴正方向上")
case (0, -1):
    print("在 y 轴负方向上")
default:
    print("在坐标轴上其他地方")
}

switch coordinate {
case (0, 0):
    print("原点")
case (_, 0):
    print("在 x 轴上")
case (0, _):
    print("在 y 轴上")
default:
    print("在坐标轴上其他地方")
}

switch coordinate {
case (0, 0):
    print("原点")
case (_, 0):
    print("在 x 轴上")
case (0, _):
    print("在 y 轴上")
case (-2..<2, -2..<2):
    print("在 -2<x<2, -2<y<2 范围内")
default:
    print("在坐标轴上其他地方")
}

switch coordinate {
case (0, 0):
    print("原点")
case (let x, 0):
    print("在 x 轴上")
    print("x 值为 \(x)")
case (0, let y):
    print("在 y 轴上")
    print("y 值为 \(y)")
case (let x, let y):
    print("坐标是 (\(x), \(y))")
}

switch coordinate {
case let (x, y) where x == y:
    print("(\(x), \(y)) x 等于 y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) x 等于 -y")
case let (x, y):
    print("(\(x), \(y)) x y 绝对值不等")
}

switch coordinate {
case (0, 0):
    print("原点")
case (_, 0):
    print("在 x 轴上")
case (0, _):
    print("在 y 轴上")
case (-2..<2, -2..<2):
    print("在 -2<x<2, -2<y<2 范围内")
    fallthrough
default:
    print("在坐标轴上其他地方")
}

let courseInfo = ("3-2", "区间运算符")

switch courseInfo {
case (_, let courseName) where courseName.hasSuffix("运算符"):
    print("课程《\(courseName)》是介绍运算符的课程")
default:
    print("《\(courseInfo.1)》是其他课程")
}


let courseName = "区间运算符"

switch courseName {
case let str where str.hasSuffix("运算符"):
    print("课程《\(courseName)》是介绍运算符的课程")
default:
    print("《\(courseName)》是其他课程")
}



/// 函数
func sayHello(name: String?) -> String {
    return "Hello, " + (name ?? "qimiao") + "!"
}

sayHello(name: "xing")
sayHello(name: nil)

func say(name: String, greet:String) -> String {
    return greet + "," + name + "!"
}

say(name: "xing", greet: "hahaha")

func sayD(name: String, greet:String = "Hello") -> String {
    return greet + "," + name + "!"
}

//sayD(name: <#T##String#>)
//say(name: <#T##String#>, greet: <#T##String#>)


func add(a: Int, b: Int, others: Int ...) -> Int {
    var result = a + b
    for number in others {
        result += number
    }
    return result
}

add(a: 2, b: 3)
add(a: 2, b: 3, others: 4, 5, 6)



func toBinary(number: Int) -> String {
    var num = number
    var result: String = ""
    repeat {
        result = String(num % 2) + result
        num /= 2
    } while num != 0
    return result
}

toBinary(number: 6)
toBinary(number: 60)


func swapTwoInts( a: inout Int, b: inout Int) {
    let t = a
    a = b
    b = t
}

var x = 0, y = 100
x
y

swapTwoInts(a: &x, b: &y)
x
y

swap(&x, &y)
x
y


/// 函数作为参数变量使用
// 复杂
func changeScores1(scores: inout [Int]) {
    for i in 0..<scores.count {
        scores[i] = Int(sqrt(Double(scores[i])) * 10)
    }
}
func changeScores2(scores: inout [Int]) {
    for i in 0..<scores.count {
        scores[i] = Int(Double(scores[i]) / 150 * 100)
    }
}
func changeScores3(scores: inout [Int]) {
    for i in 0..<scores.count {
        scores[i] += 3
    }
}

var scores1 = [23, 45, 78, 90, 58]
var scores2 = [23, 145, 118, 90, 150]
var scores3 = [23, 45, 78, 90, 58]

changeScores1(scores: &scores1)
changeScores2(scores: &scores2)
changeScores3(scores: &scores3)

// 简单
func changeScores(op: (Int)->(Int), scores: inout [Int]) {
    for i in 0..<scores.count {
        scores[i] = op(scores[i])
    }
}
func op1(x: Int) -> Int {
    return Int(sqrt(Double(x)) * 10)
}
func op2(x: Int) -> Int {
    return Int(Double(x) / 150 * 100)
}
func op3(x: Int) -> Int {
    return x + 3
}

var scores4 = [23, 45, 78, 90, 58]
var scores5 = [23, 145, 118, 90, 150]
var scores6 = [23, 45, 78, 90, 58]

changeScores(op: op1, scores: &scores4)
changeScores(op: op2, scores: &scores5)
changeScores(op: op3, scores: &scores6)


/// 数组的比较
var arr = [Int]()
for _ in 0..<10 {
    arr.append(Int(arc4random_uniform(100)))
}
arr
arr.sorted()
arr.sorted(by: <)
arr.sorted(by: >)

func compareTwoInts1(a: Int, b: Int) -> Bool {
    return a > b
}
func compareTwoInts2(a: Int, b: Int) -> Bool {
    return fabs(Double(a - 50)) > fabs(Double(b - 50))
}
arr.sorted(by: compareTwoInts1)
arr.sorted(by: compareTwoInts2)

var strArr = ["d", "cd", "bcd", "abcd", "abc", "ab", "a"]
strArr.sorted()

func compareTwoString(s1: String, s2: String) -> Bool {
    return s1.characters.count == s2.characters.count ? s1 < s2 : s1.characters.count < s2.characters.count
}
strArr.sorted(by: compareTwoString)



// 闭包
var newArr: [Int] = [1, 3, 5, 7, 9, 0, 2, 4, 6, 8]
newArr.sorted()

func compareTwoInts(a: Int, b: Int) -> Bool {
    return a > b
}
newArr.sorted(by: compareTwoInts)

newArr.sorted(by: {(a: Int, b: Int) -> Bool in
                        return a > b
                  })
newArr.sorted(by: {a, b in
                        return a > b
                  })
newArr.sorted(by: {a, b in
                        a > b
                  })
newArr.sorted(by: {
                        return $0 > $1
                  })
newArr.sorted(by: {
                        $0 > $1
                  })
newArr.sorted(by: >)

// 尾随闭包
newArr.sorted(by: ){(a: Int, b: Int) -> Bool in
    return a > b
}
newArr.sorted(by: ){a, b in
    return a > b
}
newArr.sorted(by: ){a, b in
    a > b
}
newArr.sorted(by: ){
    return $0 > $1
}
newArr.sorted(by: ){
    $0 > $1
}




// 枚举
enum GameEnding {
    case Win
    case Lose
    case Draw
}

var yourScore: Int = 100
var enemyScore: Int = 100

var theGameEnding: GameEnding
if yourScore > enemyScore {
    theGameEnding = .Win
} else if yourScore == enemyScore {
    theGameEnding = .Draw
} else {
    theGameEnding = .Lose
}

switch theGameEnding {
case .Win:
    print("You Win")
case .Draw:
    print("It's a draw")
case .Lose:
    print("You Lose")
}

// 默认值
enum Month: Int {
    case Jan = 1, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec
}

let curMonth: Month = .Nov
curMonth.rawValue

let nextMonth: Month? = Month(rawValue: 12)
nextMonth?.rawValue

var userInputNumber = 0
if let theMonth = Month(rawValue: userInputNumber) {
    switch theMonth {
    case .Jan:
        print("It's the first month")
    case .Dec:
        print("It's the lase month")
    default:
        print("It's a normal month")
    }
} else {
    print("Error, No such a month")
}


enum VowelCharacter: Character {
    case A = "a"
    case E = "e"
    case I = "i"
    case O = "o"
    case U = "u"
}

let vowelA: VowelCharacter = .A
var userInputCharacter: Character = "s"
if userInputCharacter == vowelA.rawValue {
    print("It's an 'a'")
} else {
    print("It's not an 'a'")
}


// 关联值
enum Barcode {
    case UPCA(Int, Int, Int, Int)
    case QRCode(String)
}

let productCode1 = Barcode.UPCA(4, 102, 345, 8)
let productCode2: Barcode = .QRCode("This is a information")

switch productCode2 {
case .UPCA(let numberSystem, let manufacture, let identifier, let check):
    print("UPC-A with value of \(numberSystem), \(manufacture), \(identifier), \(check).")
case .QRCode(let productCode):
    print("QR code with value of \(productCode).")
}



// While
var aWin = 0
var bWin = 0
var game = 0
while aWin < 3 && bWin < 3 {
    game += 1
    
    let a = arc4random_uniform(6) + 1
    let b = arc4random_uniform(6) + 1
    
    if a > b {
        print("A win!")
        bWin = 0
        aWin += 1
    } else if a < b {
        print("B win!")
        aWin = 0
        bWin += 1
    } else {
        print("draw")
        aWin = 0
        bWin = 0
    }
}
let winner = aWin == 3 ? "A" : "B"
print("After \(game) games, \(winner) win!")

// do...while  ==>  repeat...while
var awin = false
var bwin = false
repeat {
    let a = arc4random_uniform(6) + 1
    let b = arc4random_uniform(6) + 1
    if a > b {
        awin = true
    } else if a < b {
        bwin = true
    } else {
        print("draw")
    }
} while !awin && !bwin

let win = awin ? "A" : "B"
print("\(win) win!")


while true {
    let a = arc4random_uniform(6) + 1
    let b = arc4random_uniform(6) + 1
    
    if a == b {
        print("draw")
        continue
    }
    
    let winnerer = a > b ? "A" : "B"
    print("\(winnerer) win!")
    break
}


// x^4 - y^2 = 15*m*n
findAnswer:
for m in 1...300 {
    for n in 1...300 {
        if m*m*m*m - n*n == 15*m*n {
            print(m, n)
            break findAnswer
        }
    }
}


// if case
let age = 19

switch age {
case 10...19:
    print("You're a teenager")
default:
    print("You're not a teenager")
}

if case 10...19 = age, age >= 18 {
    print("You're a teenager")
}

let vector = (4, 0)
if case (let x, 0) = vector, x > 2 && x < 5 {
    print("It's the vector")
}


for i in 1...100 {
    if i % 3 == 0 {
        print(i)
    }
}

for case let i in 1...100 where i % 3 == 0 {
    print(i)
}

for i in 1...100 where i % 3 == 0 {
    print(i)
}




/// 可选项
// 隐式可选型：暂时存一个 nil ，使用的时候在进行赋值操作
class City {
    let cityName: String
    unowned var country: Country                // unowned 避免内存泄漏
    
    init(cityName: String, country: Country) {
        self.cityName = cityName
        self.country = country
    }
}

class Country {
    let countryName: String
    var capitalCity: City!          // 隐式可选型，否则构造函数中 self 不能使用
    
    init(countryName: String, capitalCity: String) {
        self.countryName = countryName
        self.capitalCity = City(cityName: capitalCity, country: self)
    }
    
    func showInfo() {
        print("This is \(countryName)")
        print("The capital is \(capitalCity.cityName)")
    }
}

let china = Country(countryName: "中国", capitalCity: "北京")
china.showInfo()


/// 数组
var allZeros1 = [Int](repeatElement(0, count: 5))
var allZeros2 = Array<Int>(repeatElement(0, count: 5))

allZeros1.count
allZeros1.isEmpty

allZeros1.min()
allZeros1.max()

print("Hello", 1, 2, 3, separator: ",", terminator: ".")


var scores = [65, 93, 34, 84, 56, 69, 23]
func PassOrFail(scores: Int) -> String {
    return scores < 60 ? "Fail" : "Pass"
}
func failScores(scores: Int) -> Bool {
    return scores < 60
}
func add(num1: Int, num2: Int) -> Int {
    return num1 + num2
}
func concatenate(str: String, num: Int) -> String {
    return str + String(num) + "我是间隔"
}

scores.map(PassOrFail)                  // 改变数组内容
scores.filter(failScores)               // 返回符合条件的内容
scores.reduce(0, add)                   // 结合内容归一
scores.reduce(0, +)
scores.reduce("start", concatenate)

scores.sorted()                         // 不改变原数组
scores
scores.sort()                           // 改变了原数组
scores


//...
var a = 1, b = -2
swap(&a, &b)
a
b
abs(a)
abs(b)







