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
        colourView.layer.cornerRadius = colourView.frame.width / 10
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "1134751")
        backgroundImage.contentMode = .scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
        
    }
    
    //MARK: - IB Actions
    
    @IBAction func chagingColours() {
        colourView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1)
    }
    
    @IBAction func redSliderAction() {
        redValue.text = floatToString(from: redSlider)
        
    }
    
    @IBAction func greenSliderAction() {
        greenValue.text = floatToString(from: greenSlider)
    }
    
    @IBAction func blueSliderAction() {
        blueValue.text = floatToString(from: blueSlider)
    }
    
    private func floatToString(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }

}
