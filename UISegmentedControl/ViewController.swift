//
//  ViewController.swift
//  UISegmentedControl
//
//  Created by Maxim Bekmetov on 05.09.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        slider.value = 1
        
        label.text = String(slider.value)
        label.font = label.font.withSize(35)
        label.textAlignment = .center
        label.numberOfLines = 2
        
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: true)
        
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .yellow
        slider.maximumTrackTintColor = .red
        slider.tintColor = .blue
        
    }

    @IBAction func choiceSegment(_ sender: UISegmentedControl) {
        
        label.isHidden = false
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            label.text = "The first segment is selected"
            label.textColor = .red
        case 1:
            label.text = "The second segment is selected"
            label.textColor = .blue
        case 2:
            label.text = "The third segment is selected"
            label.textColor = .yellow
        default:
            print("Somthing wrong!")
        }
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        label.text = String(sender.value)
        
        let backgroundColour = self.view.backgroundColor
        self.view.backgroundColor = backgroundColour?.withAlphaComponent(CGFloat(sender.value))
    }
    
    
    @IBAction func donePressed(_ sender: UIButton) {
        
        guard textField.text?.isEmpty == false else { return }
        
        if let _ = Double(textField.text!) {
            
            let alert = UIAlertController(title: "Wrong format!", message: "Please enter your name", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil) // call action alert
        
            print("Name format is wrong!")
        } else {
            label.text = textField.text
            textField.text = nil
        }
        
    }
}

