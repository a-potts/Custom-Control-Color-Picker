//
//  ColorPicker.swift
//  ColorPicker
//
//  Created by Austin Potts on 9/12/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ColorPicker: UIControl {

    var colorWheel: ColorWheel!
    var brightnessSlider: UISlider!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpSubViews()
    }
    
    func setUpSubViews(){
        
        //Set up the color wheel/ Constrain
        
        colorWheel = ColorWheel()
        colorWheel.translatesAutoresizingMaskIntoConstraints = false
        
        
        addSubview(colorWheel)
        
        NSLayoutConstraint.activate([colorWheel.topAnchor.constraint(equalTo: self.topAnchor),
                                     colorWheel.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     colorWheel.trailingAnchor.constraint(equalTo: trailingAnchor),
                                     colorWheel.heightAnchor.constraint(equalTo: colorWheel.widthAnchor)
            ])
        
        
        
        
        // Set up the slider/ Constarin
        brightnessSlider = UISlider()
        brightnessSlider.minimumValue = 0
        brightnessSlider.maximumValue = 1
        brightnessSlider.value = 0.8 //This should match up with what the color wheel has in its property
        brightnessSlider.addTarget(self, action: #selector(changeBrightness), for: .valueChanged)
        
        brightnessSlider.translatesAutoresizingMaskIntoConstraints = false
        addSubview(brightnessSlider)
        
        NSLayoutConstraint.activate([brightnessSlider.topAnchor.constraint(equalTo: colorWheel.bottomAnchor, constant: 8),
                                     brightnessSlider.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     brightnessSlider.trailingAnchor.constraint(equalTo: trailingAnchor)
            ])
        
        
        
        
    }
    
    @objc func changeBrightness() {
        
        colorWheel.brightness = CGFloat(brightnessSlider.value)
        
    }

}
