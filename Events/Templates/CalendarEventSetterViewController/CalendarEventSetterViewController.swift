//
//  CalendarEventSetterViewController.swift
//  Events
//
//  Created by Lourdes on 6/26/21.
//

import UIKit

protocol AddNewEventDelegate: AnyObject {
    func addEvent(time: Date, title: String, remindBefore: RemindBefore)
}

enum RemindBefore: Int {
    case tenMinutes = 0
    case oneHour = 1
    
    var reminderContext: String {
        switch self {
        case .tenMinutes:
            return "Event in 10 minutes"
        case .oneHour:
            return "Event in 1 hour"
        }
    }
    
    var timeToAdd: TimeInterval {
        switch self {
        case .tenMinutes:
            return 1000
        case .oneHour:
            return 6000
        }
    }
}

class CalendarEventSetterViewController: UIViewController {
// MARK: - Outlets
    @IBOutlet weak var eventTitle: UITextField!
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var reminderControl: UISegmentedControl!
    @IBOutlet weak var addButton: UIButton!
    
    weak var delegate: AddNewEventDelegate?
    
    var selectedDate: Date?
    
// MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initialSetup()
    }
    
    func initialSetup() {
        addButton.isEnabled = false
        timePicker.date = selectedDate ?? Date()
    }
    
// MARK: - Button Actions
    @IBAction func onTapCancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func textFieldDidChange(_ sender: Any) {
        addButton.isEnabled = !(eventTitle.text?.isEmpty ?? true)
    }
    
    @IBAction func onTapAddButton(_ sender: Any) {
        guard let remindBefore = RemindBefore(rawValue: reminderControl.selectedSegmentIndex) else { return }
        self.dismiss(animated: true, completion: nil)
        var timeToSetReminder = timePicker.date
        timeToSetReminder.addTimeInterval(remindBefore.timeToAdd)
        delegate?.addEvent(time: timeToSetReminder, title: eventTitle.text ?? "", remindBefore: remindBefore)
    }
}
