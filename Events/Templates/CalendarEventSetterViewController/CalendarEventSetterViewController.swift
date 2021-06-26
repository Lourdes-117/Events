//
//  CalendarEventSetterViewController.swift
//  Events
//
//  Created by Lourdes on 6/26/21.
//

import UIKit

class CalendarEventSetterViewController: UIViewController {
// MARK: - Outlets
    @IBOutlet weak var eventTitle: UITextField!
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var reminderControl: UISegmentedControl!
    @IBOutlet weak var addButton: UIButton!
    
// MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initialSetup()
    }
    
    func initialSetup() {
        addButton.isEnabled = false
    }
    
// MARK: - Button Actions
    @IBAction func onTapCancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func textFieldDidChange(_ sender: Any) {
        addButton.isEnabled = !(eventTitle.text?.isEmpty ?? true)
    }
    
    @IBAction func onTapAddButton(_ sender: Any) {
        
    }
}
