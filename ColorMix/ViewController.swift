//
//  ViewController.swift
//  ColorMix
//
//  Created by Dmitrij Meidus on 29.04.22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var redSwitch: UISwitch!
    @IBOutlet weak var greenSwitch: UISwitch!
    @IBOutlet weak var blueSwitch: UISwitch!
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.borderWidth = 5
        colorView.layer.cornerRadius = 20
        colorView.layer.borderColor =
           UIColor.black.cgColor
        updateControls()
        showCodeOfRBG()
    }

    @IBAction func updateColor(_ sender: UISwitch) {
        updateColorAndStatus()
    }
    func updateControls() {
        redSlider.isEnabled = redSwitch.isOn
        greenSlider.isEnabled = greenSwitch.isOn
        blueSlider.isEnabled = blueSwitch.isOn
    }
    
    fileprivate func updateColorAndStatus() {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        if redSwitch.isOn {
            red = CGFloat(redSlider.value)
        }
        
        if greenSwitch.isOn {
            green = CGFloat(greenSlider.value)
        }
        if blueSwitch.isOn {
            blue = CGFloat(blueSlider.value)
        }
        let color = UIColor(red: red, green: green,
                            blue: blue, alpha: 1)
        colorView.backgroundColor = color
        updateControls()
        showCodeOfRBG()
    }
    
    @IBAction func sliderChanged(_ sender: Any) {
        updateColorAndStatus()
    }
    @IBAction func reset(_ sender: Any) {
        redSwitch.isOn = false
        greenSwitch.isOn = false
        blueSwitch.isOn = false
        redSlider.value = 1
        greenSlider.value = 1
        blueSlider.value = 1
        colorView.backgroundColor = UIColor(red: 1, green: 1,
                                            blue: 1, alpha: 1)
        updateControls()
        showCodeOfRBG()
    }
    
    @IBOutlet weak var showCodeOfRGB: UITextView!
    @IBAction func showCodeOfRBG(){
        var red: Float = 0
        var green: Float = 0
        var blue: Float  = 0
        if redSwitch.isOn {
            red = redSlider.value
        }
        if greenSwitch.isOn {
            green = greenSlider.value
        }
        if blueSwitch.isOn {
            blue = blueSlider.value
        }
        showCodeOfRGB.text = "Decimal Code(R,G,B) = (\(String(format: "%.f", red * 255)),\(String(format: "%.f",green * 255)),\(String(format: "%.f",blue * 255)))\nHex Code(#RRGGBB) = (\(String(format: "%02X", Int(red * 255))),\(String(format: "%02X", Int(green * 255))),\(String(format: "%02X", Int(blue * 255))))"
    }
}
