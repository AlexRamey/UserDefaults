//
//  ViewController.swift
//  UserDefaults
//
//  Created by Alex Ramey on 1/5/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        if let data = UserDefaults.standard.object(forKey: THEME_COLOR_KEY) as? Data,
            let defaultColor = NSKeyedUnarchiver.unarchiveObject(with: data) as? UIColor {
            
            self.view.backgroundColor = defaultColor
            
            // configure sliders to correct initial value
            redSlider.value = Float(defaultColor.cgColor.components?[0] ?? 0.0)
            greenSlider.value = Float(defaultColor.cgColor.components?[1] ?? 0.0)
            blueSlider.value = Float(defaultColor.cgColor.components?[2] ?? 0.0)
        }
    }
    
    @IBAction func sliderValueChanged() {
        let newDefaultColor = UIColor(red: CGFloat(redSlider.value),
                                      green: CGFloat(greenSlider.value),
                                      blue: CGFloat(blueSlider.value),
                                      alpha: 1.0)
        self.view.backgroundColor = newDefaultColor
        
        // Save the new default color to the Application Domain of UserDefaults
        UserDefaults.standard.setValue(NSKeyedArchiver.archivedData(withRootObject: newDefaultColor), forKey: THEME_COLOR_KEY)
    }

}

