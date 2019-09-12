//
//  ColorWheel.swift
//  ColorPicker
//
//  Created by Austin Potts on 9/12/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ColorWheel: UIView {
    
    
    override func layoutSubviews() {
        let radius = bounds.width / 2
        
        layer.cornerRadius = radius
        
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
        
        clipsToBounds = true
    }
    
    var brightness: CGFloat = 0.8

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        
        //Go through every point in the view and figure out what color it should be then draw it
        for y in stride(from: 0, through: bounds.maxY, by: 1) {
            for x in stride(from: 0, through: bounds.maxX, by: 1) {
                let point = CGPoint(x: x, y: y)
                
                let color = self.color(for: point)
                //This is the same as calling setFillColor
                color.setFill()
                
                let pixel = CGRect(x: x, y: y, width: 1, height: 1)
                
                UIRectFill(pixel)
                
            }
        }
        
    }
    
    
    func color(for location: CGPoint) -> UIColor {
        
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let dy = location.y - center.y
        let dx = location.x - center.x
        let offSet = CGPoint(x: dx / center.x, y: dy / center.y)
        
        let (hue, saturation) = getHueSaturation(at: offSet)
        
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1.0)
        
    }
    
    
    func getHueSaturation(at offset: CGPoint) -> (hue: CGFloat, saturation: CGFloat) {
        if offset == CGPoint.zero {
            return (hue: 0, saturation: 0)
        } else {
            // the further away from the center you are, the more saturated the color
            let saturation = sqrt(offset.x * offset.x + offset.y * offset.y)
            // the offset angle is determined to figure out what hue to use within the full spectrum
            var hue = acos(offset.x / saturation) / (2.0 * CGFloat.pi)
            if offset.y < 0 { hue = 1.0 - hue }
            return (hue: hue, saturation: saturation)
        }
    }
    

}
