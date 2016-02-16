//: Playground - noun: a place where people can play

import UIKit
import Foundation

import XCPlayground

let canvas = UIView(frame: CGRectMake(0, 0, 500, 700))
canvas.backgroundColor = UIColor.whiteColor()

XCPlaygroundPage.currentPage.liveView = canvas
class ProgressView: UIView  {
    var layers = [CAShapeLayer]()
    let progressLayer = CAShapeLayer()
    let progressLayer2 = CAShapeLayer()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createProgressLayer()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createProgressLayer()
    }
    
    
    func animateProgressView(timeLeft: Int) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = CGFloat(0.0)
        animation.toValue = CGFloat(1.0)
        animation.duration = Double(timeLeft)
        animation.removedOnCompletion = false
        animation.additive = true
        animation.fillMode = kCAFillModeBackwards
        progressLayer.addAnimation(animation, forKey: "strokeEnd")
    }


private func createProgressLayer() {
    let startAngle = CGFloat(M_PI_2)
    let endAngle = CGFloat(M_PI * 2 + M_PI_2)
    let centerPoint = CGPointMake(CGRectGetWidth(canvas.frame)/2, CGRectGetHeight(canvas.frame)/2)
    
    let gradientMaskLayer = gradientMask()
    
        progressLayer.path = UIBezierPath(arcCenter: centerPoint, radius: CGRectGetWidth(canvas.frame)/2-30.0, startAngle: startAngle, endAngle: endAngle, clockwise: true).CGPath
    
    
        progressLayer.backgroundColor = UIColor.clearColor().CGColor
        progressLayer.fillColor = nil
        progressLayer.strokeColor = UIColor.blackColor().CGColor
        progressLayer.strokeStart = 0.0
        progressLayer.strokeEnd = 0.0
        progressLayer.lineWidth = 10

        gradientMaskLayer.mask = progressLayer
        canvas.layer.addSublayer(gradientMaskLayer)
}
    
private func gradientMask() -> CAGradientLayer {
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = canvas.frame
        
    gradientLayer.locations = [0.0, 1.0]
        
    let colorTop: AnyObject = UIColor(red: 255.0/255.0, green: 213.0/255.0, blue: 63.0/255.0, alpha: 1.0).CGColor
    let colorBottom: AnyObject = UIColor(red: 55.0/255.0, green: 128.0/255.0, blue: 57.0/255.0, alpha: 1.0).CGColor
    let arrayOfColors: [AnyObject] = [colorTop, colorBottom]
        gradientLayer.colors = arrayOfColors
        
    return gradientLayer

    }
}

func secondsToHoursMinutesSeconds (seconds : Int) -> (Int, Int, Int) {
    return (seconds / 3600, (seconds % 3600) / 60, (seconds % 60))
}


var test = ProgressView()
test.animateProgressView(10)

var startTime = NSTimeInterval()


var view = UIView(frame: CGRectMake(0,0, 100, 50))
view.center = canvas.center
view.backgroundColor = UIColor.orangeColor()
let lbl = UILabel(frame: CGRectMake(0, 0, 100, 50))
lbl.center = canvas.center

lbl.center = canvas.center
lbl.text = "Hello"
lbl.textAlignment = NSTextAlignment.Center
canvas.addSubview(view)
canvas.addSubview(lbl)







//let canvas = UIView(frame: CGRectMake(0, 0, 200, 200))
//
//canvas.backgroundColor = UIColor.darkGrayColor()
//
//
//
//let title = UILabel(frame: CGRectMake(50, 50, 100, 20))
//title.text = "MummiSnow"
//title.textColor = UIColor.orangeColor()
//title.textAlignment = NSTextAlignment.Center
//
//
//
//
//let button = UIButton(frame: CGRectMake(50, 100, 100, 50))
//button.backgroundColor = UIColor.whiteColor()
//button.setTitle("My Button", forState: UIControlState.Normal)
//button.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Normal)
//
//button.layer.cornerRadius = 10
//button.layer.shadowColor = UIColor.blackColor().CGColor
//button.layer.shadowOpacity = 0.1
//button.layer.shadowOffset = CGSizeMake(10,10)
//button.layer.shadowRadius = 10
//
//canvas.addSubview(button)
//canvas.addSubview(title)
//
//var colors = ["red", "green", "blue"]
//colors[2]
//
//var shots = [["title":"Shot 1"],["title": "Shot 2"]]
//
//shots[1]["title"]
//
//
//
//let containerView = UIView(frame: CGRectMake(0.0, 0.0, 375, 667))
//XCPShowView("Container View", view: containerView)
//
//let circle = UIView(frame: CGRectMake(0.0,0.0,50,50))
//circle.backgroundColor = UIColor.orangeColor()
//circle.center = containerView.center
//circle.layer.cornerRadius = 25
//
//containerView.addSubview(circle)
//
//let rectangle = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 50.0, height: 50.0))
//rectangle.center = containerView.center
//rectangle.layer.cornerRadius = 5.0
//
//rectangle.backgroundColor = UIColor.whiteColor()
//
//containerView.addSubview(rectangle)
//
//
//let popoverView = UIView(frame: CGRectMake(0.0, 0.0, 40.0, 40.0))
//
//popoverView.backgroundColor = UIColor.whiteColor()
//popoverView.center = CGPointMake(containerView.frame.width/1.5, containerView.frame.height/1.5)
//let scale = CGAffineTransformMakeScale(0.3, 0.3)
//let translate = CGAffineTransformMakeTranslation(50, -50)
//popoverView.transform = CGAffineTransformConcat(scale, translate)
//popoverView.alpha = 0
//containerView.addSubview(popoverView)
//
//
//
//UIView.animateWithDuration(1.3, animations: {
//    
//    let scale = CGAffineTransformMakeScale(1, 1)
//    let translate = CGAffineTransformMakeTranslation(0, 0)
//    popoverView.transform = CGAffineTransformConcat(scale, translate)
//    popoverView.alpha = 1
//    
//})
//
//
//UIView.animateWithDuration(3, animations: { () -> Void in
//    
//    let endingColor = UIColor.yellowColor()
//    circle.backgroundColor = endingColor
//    
//    let scaleTransform = CGAffineTransformMakeScale(5.0, 5.0)
//    
//    circle.transform = scaleTransform
//    
//    let rotationTransform = CGAffineTransformMakeRotation(3.14)
//    
//    rectangle.transform = rotationTransform
//    
//    
//})


// MARK - JSON SERIALIZATION






















