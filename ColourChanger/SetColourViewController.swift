//
//  ViewController.swift
//  ColourChanger
//
//  Created by hiirari on 25.09.2022.
//

import UIKit

class SetColourViewController: UIViewController {
    
    // MARK: - IB Outlets
    
    @IBOutlet var colourView: UIView!

    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redValue: UILabel!
    @IBOutlet var greenValue: UILabel!
    @IBOutlet var blueValue: UILabel!
    
    @IBOutlet var doneButton: UIButton!
    
    var viewColour: UIColor!
    var delegate: SetColourViewControllerDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        showCurrentViewColour(from: viewColour)
        setupUI()
        setValueText()
        setColour()
    }
    
    //MARK: - IB Actions
    
    @IBAction func sliderAction(_ sender: UISlider) {
        setColour()
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

    @IBAction func doneButtonPressed() {
        delegate.setNewColour(for: colourView.backgroundColor ?? .white)
        dismiss(animated: true)
    }
    
    private func setValueText() {
        redValue.text = string(from: redSlider)
        greenValue.text = string(from: greenSlider)
        blueValue.text = string(from: blueSlider)
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }

    private func setColour(){
        colourView.backgroundColor = UIColor(
                   red: CGFloat(redSlider.value),
                   green: CGFloat(greenSlider.value),
                   blue: CGFloat(blueSlider.value),
                   alpha: 1)
        
    }
    
    private func showCurrentViewColour(from viewColour: UIColor) {
        let ciColor = CIColor(color: viewColour)
        
        redSlider.value = Float(ciColor.red)
        greenSlider.value = Float(ciColor.green)
        blueSlider.value = Float(ciColor.blue)

    }
    private func setupUI() {
        colourView.layer.cornerRadius =  45
        doneButton.layer.cornerRadius = 20
        view.backgroundColor = .lightGray

    }
}
//
////CIColor который расщепляет цвет на компоненты:
//let ciColor = CIColor(color: mainViewColor)
//
//redSlider.value = Float(ciColor.red)
//greenSlider.value = Float(ciColor.green)
//blueSlider.value = Float(ciColor.blue)
