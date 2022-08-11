//
//  ViewController.swift
//  UpDownGame
//
//  Created by GSM02 on 2022/07/06.
//

import UIKit

class ViewController: UIViewController {
    
    var randomValue: Int = 0
    var tryCount: Int = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var tryCountLabel: UILabel!
    @IBOutlet weak var sliderValueLabel: UILabel!
    @IBOutlet weak var minimumValueLabel: UILabel!
    @IBOutlet weak var maximumValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slider.setThumbImage(#imageLiteral(resourceName: "slider_thumb.png"), for: .normal)
        reset()
    }

    @IBAction func sliderValueChanged( sender: UISlider) {
        print(sender.value)
        let interegerValue: Int = Int(slider.value)
        sliderValueLabel.text = String(interegerValue)
    }
    
    @IBAction func touchUpHitButton ( sender: UIButton ) {
        print(slider.value)
        let hitValue: Int = Int(slider.value)
        slider.value = Float(hitValue)
        
        tryCount += 1
        tryCountLabel.text = "\(tryCount) / 5"
        
        if hitValue == randomValue {
            print("YOU HIT!")
            showAlert(message: "YOU HIT!")
        } else if tryCount >= 5 && hitValue != randomValue {
            print("YOU LOSE...")
            showAlert(message: "YOU LOSE...")
        } else if hitValue < randomValue {
            slider.minimumValue = Float(hitValue)
            minimumValueLabel.text = String(hitValue)
        } else if hitValue > randomValue {
            slider.maximumValue = Float(hitValue)
            maximumValueLabel.text = String(hitValue)
        }
        
    }
    
    @IBAction func touchUpResetButton( sender: UIButton) {
        print("touch up reset button")
        reset()
    }
    
    func reset() {
        print("reset!")
        randomValue = Int.random(in: 0...30)
        tryCount = 0
        slider.minimumValue = 0
        slider.maximumValue = 30
        slider.value = 15
        tryCountLabel.text = "0 / 5"
        sliderValueLabel.text = "15"
        minimumValueLabel.text = "0"
        maximumValueLabel.text = "30"
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.reset()
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
}

