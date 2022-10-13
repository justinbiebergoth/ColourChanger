//
//  ShowChosenColourViewController.swift
//  ColourChanger
//
//  Created by hiirari on 12.10.2022.
//

import UIKit

protocol SetColourViewControllerDelegate {
    func setNewColour(for setupColour:  UIColor)
}

class MainViewController: UIViewController {
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        guard let setColourVC = segue.destination as? SetColourViewController else { return }
        
        setColourVC.viewColour = view.backgroundColor
        setColourVC.delegate = self
    }


}
extension MainViewController: SetColourViewControllerDelegate {
    func setNewColour(for viewColour: UIColor) {
        view.backgroundColor = viewColour
    }
}
