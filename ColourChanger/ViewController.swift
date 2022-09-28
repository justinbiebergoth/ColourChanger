//
//  ViewController.swift
//  ColourChanger
//
//  Created by hiirari on 25.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    
    @IBOutlet var colourView: UIView!

    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redValue: UILabel!
    @IBOutlet var greenValue: UILabel!
    @IBOutlet var blueValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colourView.layer.cornerRadius =  20
        setValueText()
        setupColour()
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "1134751")
        backgroundImage.contentMode = .scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
    }
    
    //MARK: - IB Actions
    
    @IBAction func sliderAction(_ sender: UISlider) {
        setupColour()
        setValueText()
        switch sender {
        case redSlider:
            redValue.text = string(from: sender)
        case greenSlider:
            greenValue.text = string(from: sender)
        default:
            blueValue.text = string(from: sender)
        }
  
    }
    
    private func setValueText() {
        redValue.text = string(from: redSlider)
        greenValue.text = string(from: greenSlider)
        blueValue.text = string(from: blueSlider)
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }

    private func setupColour() {
            colourView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1)
    }
}
