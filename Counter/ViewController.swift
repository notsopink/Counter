//
//  ViewController.swift
//  Counter
//

import UIKit

class ViewController: UIViewController {
    let formatter = DateFormatter()
    var counter: Int = 0
    
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var substractButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var textBox: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        formatter.timeStyle = .medium
        formatter.dateStyle = .medium

        addButton.tintColor = .red
        substractButton.tintColor = .blue
        clearButton.tintColor = .gray
        
        
    }
    func scrollTextToBottom(_ box: UITextView) {
        let bottom = NSMakeRange(box.text.count - 1, 1)
        box.scrollRangeToVisible(bottom)
    }
    
    @IBAction func add(_ sender: Any) {
        textBox.text.append("\n[\(formatter.string(from: Date()))]: значение изменено на +1")
        counter += 1
        textLabel.text = "Значение счётчика: \(self.counter)"
        scrollTextToBottom(textBox)
    }

    @IBAction func substract(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            textBox.text.append("\n[\(formatter.string(from: Date()))]: значение изменено на -1")
            textLabel.text = "Значение счётчика: \(self.counter)"
        } else {
            textBox.text.append("\n[\(formatter.string(from: Date()))]: попытка уменьшить значение счётчика ниже 0")
        }
        scrollTextToBottom(textBox)
    }
    
    @IBAction func clear(_ sender: Any) {
        textBox.text.append("\n[\(formatter.string(from: Date()))]: значение сброшено")
        counter = 0
        textLabel.text = "Значение счётчика: \(self.counter)"
        scrollTextToBottom(textBox)
    }
}

