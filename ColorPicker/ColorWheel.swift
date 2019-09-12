//
//  ColorWheel.swift
//  ColorPicker
//
//  Created by Austin Potts on 9/12/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ColorWheel: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        
        
        
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