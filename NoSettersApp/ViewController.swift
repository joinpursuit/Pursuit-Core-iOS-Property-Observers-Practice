import UIKit

class ViewController: UIViewController {
    @IBOutlet var textField: UITextField!
    @IBOutlet var stepper: UIStepper!
    @IBOutlet var slider: UISlider!
    @IBOutlet var progressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        textField.text = "\(50)"
        stepper.value = 50
        slider.value = 50
        progressView.progress = 50 / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        textField.text = "\(Int(sender.value))"
        slider.value = Float(sender.value)
        progressView.progress = Float(sender.value) / 100
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        textField.text = "\(Int(sender.value))"
        stepper.value = Double(sender.value)
        progressView.progress = sender.value / 100
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let newText = textField.text,
              let newDouble = Double(newText) else { return true }
        let newInt = Int(newDouble)
        stepper.value = newDouble
        slider.value = Float(newInt)
        progressView.progress = Float(newInt) / 100
        return true
    }
}
