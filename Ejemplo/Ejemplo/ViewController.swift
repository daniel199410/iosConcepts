//
//  ViewController.swift
//  Ejemplo
//
//  Created by Daniel Cataño Restrepo on 4/10/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    private let pickerValues = ["Uno", "Dos", "Tres", "Cuatro", "Cinco"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.dataSource = self
        picker.delegate = self
        pageControl.numberOfPages = pickerValues.count
        pageControl.backgroundStyle = .prominent
        segmentedControl.removeAllSegments()
        for (index, value) in pickerValues.enumerated() {
            segmentedControl.insertSegment(withTitle: value, at: index, animated: true)
        }
    }

    
    @IBAction func button(_ sender: Any) {
        if label.text == "Sí" {
            label.text = "No"
        } else {
            label.text = "Sí"
        }
    }
    
    @IBAction func pageControlAction(_ sender: Any) {
        picker.selectRow(pageControl.currentPage, inComponent: 0, animated: true)
        label.text = pickerValues[pageControl.currentPage]
        segmentedControl.selectedSegmentIndex = pageControl.currentPage
    }
    
    @IBAction func segmentedControlAction(_ sender: Any) {
        picker.selectRow(segmentedControl.selectedSegmentIndex, inComponent: 0, animated: true)
        pageControl.currentPage = segmentedControl.selectedSegmentIndex
        label.text = pickerValues[segmentedControl.selectedSegmentIndex]
    }
    
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerValues.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerValues[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        label.text = pickerValues[row]
        pageControl.currentPage = row
        segmentedControl.selectedSegmentIndex = row
    }
}
