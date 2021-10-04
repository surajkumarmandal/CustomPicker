//
//  ViewController.swift
//  CustomPicker
//
//  Created by Suraj Kumar Mandal on 01/10/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var selectTF: UITextField!
    
    fileprivate let pickerView = ToolbarPickerView()
    fileprivate let titles = ["0", "1", "2", "3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.selectTF.inputView = self.pickerView
        self.selectTF.inputAccessoryView = self.pickerView.toolbar
        
        self.pickerView.dataSource = self
        self.pickerView.delegate = self
        self.pickerView.toolbarDelegate = self
        
        self.pickerView.reloadAllComponents()
    }
    
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.titles.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.titles[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectTF.text = self.titles[row]
    }
}

extension ViewController: ToolbarPickerViewDelegate {
    
    func didTapDone() {
        let row = self.pickerView.selectedRow(inComponent: 0)
        self.pickerView.selectRow(row, inComponent: 0, animated: false)
        self.selectTF.text = self.titles[row]
        self.selectTF.resignFirstResponder()
    }
    
    func didTapCancel() {
        self.selectTF.text = nil
        self.selectTF.resignFirstResponder()
    }
}
