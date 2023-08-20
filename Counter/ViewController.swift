//
//  ViewController.swift
//  Counter
//

import UIKit

class ViewController: UIViewController {
    private let formatter = DateFormatter()
    private var counter: Int = 0
    
    @IBOutlet weak private var counterLabel: UILabel!
    @IBOutlet weak private var addButton: UIButton!
    @IBOutlet weak private var subtractButton: UIButton!
    @IBOutlet weak private var clearButton: UIButton!
    @IBOutlet weak private var logTextBox: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formatter.timeStyle = .medium
        formatter.dateStyle = .medium
        
        addButton.tintColor = .red
        subtractButton.tintColor = .blue
        clearButton.tintColor = .gray
    }

    private func scrollTextToBottom(_ box: UITextView) {
        let bottom = NSMakeRange(box.text.count - 1, 1)
        box.scrollRangeToVisible(bottom)
    }
    
    @IBAction private func add(_ sender: Any) {
        logTextBox.text.append("\n[\(formatter.string(from: Date()))]: значение изменено на +1")
        counter += 1
        counterLabel.text = "Значение счётчика: \(self.counter)"
        scrollTextToBottom(logTextBox)
    }
    
    @IBAction private func subtract(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            logTextBox.text.append("\n[\(formatter.string(from: Date()))]: значение изменено на -1")
            counterLabel.text = "Значение счётчика: \(self.counter)"
        } else {
            logTextBox.text.append("\n[\(formatter.string(from: Date()))]: попытка уменьшить значение счётчика ниже 0")
        }
        scrollTextToBottom(logTextBox)
    }
    
    @IBAction private func clear(_ sender: Any) {
        logTextBox.text.append("\n[\(formatter.string(from: Date()))]: значение сброшено")
        counter = 0
        counterLabel.text = "Значение счётчика: \(self.counter)"
        scrollTextToBottom(logTextBox)
    }
}

