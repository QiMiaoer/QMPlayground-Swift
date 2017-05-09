//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport


class View: UIView {
    override func draw(_ rect: CGRect) {
        
        self.backgroundColor = UIColor.cyan
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        context.setStrokeColor(UIColor.black.cgColor)
        
        let strokeWidth: CGFloat = 3.0
        context.setLineWidth(strokeWidth)
        
        let center = CGPoint(x: self.frame.midX, y: self.frame.maxY)
        let radius = self.frame.midX - strokeWidth
        let startAngle: CGFloat = 0.0
        let endAngle: CGFloat = 2 * CGFloat.pi
        context.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        
        context.drawPath(using: .stroke)
    }
}

let view = View(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
PlaygroundPage.current.liveView = view



//// FloatingPoint
func hypotenuse<T: FloatingPoint>(_ a: T, _ b: T) -> T {
    return (a * a + b * b).squareRoot()
}
let aFloat: Float = 3.0
let bFloat: Float = 4.0
hypotenuse(aFloat, bFloat)

let aCGFloat: CGFloat = 3.0
let bCGFloat: CGFloat = 4.0
hypotenuse(aCGFloat, bCGFloat)

let aDouble: Double = 3.0
let bDouble: Double = 4.0
hypotenuse(aDouble, bDouble)

/// pi
let a: Float = 2.0
a * Float.pi
a * .pi                 // 自动匹配类型

let b: CGFloat = 3.0
b * CGFloat.pi
b * .pi                 // 自动匹配类型



//// NaN (Not a Number)
let myNaN = Double.nan
let youNaN = CGFloat.nan
myNaN > 0
myNaN <= 0

func divide<T: FloatingPoint>(_ a: T, _ b: T) -> T {
    if b.isZero {
        return T.nan
    }
    return a / b
}

divide(10.0, 0.0).isNaN

/// 例子
let tempData = ["32.3", "43.5", "45", "no data", "45.0", "no data", "34", "haha", "hehe"]
let tempNumber = tempData.map{Double($0) ?? .nan}
tempNumber

let badAverage = tempNumber.reduce(0.0, +) / Double(tempNumber.count)
badAverage
let validTemps = tempNumber.filter{!$0.isNaN}
validTemps
let average = validTemps.reduce(0.0, +) / Double(validTemps.count)




//// 自动转换关键字    @autoclosure
infix operator ???
func ???<T>(optional: T?, defaultValue: @autoclosure () -> T) -> T {
    if let value = optional {
        return value
    }
    return defaultValue()
}

let name: String? = "haha"
let nickName = name ??? "hehe"
let nickName2 = name ?? "hehe"
















