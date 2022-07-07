//
//  Extentions.swift
//  test
//
//  Created by MacBook on 02.07.2022.
//

import UIKit

extension Notification.Name {
    static let showMenu = Notification.Name("showMenu")
    static let finishLogin = Notification.Name("finishLogin")
}

extension UIColor {
    
    // MARK: UIColor + Colors
    static let darkBlue = UIColor(red: 23/255, green: 24/255, blue: 34/255, alpha: 1.0)
    static let blue = UIColor(red: 33/255, green: 35/255, blue: 48/255, alpha: 1.0)
    static let lightBlue = UIColor(red: 42/255, green: 44/255, blue: 56/255, alpha: 1.0)
    
    
    static let darkTextColor = UIColor(red: 123/255, green: 127/255, blue: 158/255, alpha: 1.0)
}

extension UILabel
{
    func setLineHeight(lineHeight: CGFloat)
    {
        let text = self.text
        if let text = text
        {

            let attributeString = NSMutableAttributedString(string: text)
            let style = NSMutableParagraphStyle()

            style.lineSpacing = lineHeight
            attributeString.addAttribute(NSAttributedString.Key.paragraphStyle,
                                        value: style,
                                        range: NSMakeRange(0, text.count))
           self.attributedText = attributeString
        }
    }
}

extension UIButton {
    
    private func imageWithColor(color: UIColor) -> UIImage? {
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
    func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
        self.setBackgroundImage(imageWithColor(color: color), for: state)
    }
}

@nonobjc extension UIViewController {
    // https://www.hackingwithswift.com/example-code/uikit/how-to-use-view-controller-containment
    func add(_ child: UIViewController, frame: CGRect? = nil) {
        addChild(child)

        if let frame = frame {
            child.view.frame = frame
        }

        view.addSubview(child.view)
        child.didMove(toParent: self)
    }

    func remove() {
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}

extension UIView {
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}
