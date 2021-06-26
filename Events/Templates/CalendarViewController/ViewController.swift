//
//  ViewController.swift
//  Events
//
//  Created by Lourdes on 6/24/21.
//

import UIKit

class ViewController: UIViewController {
    
    let viewModel = CalendarViewModel()
    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initialSetup()
    }
    
    private func initialSetup() {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as? CalendarPageViewController
        viewController?.calendarSelectionDelegate = self
    }
}

// MARK: - Calendar Selection Delegate
extension ViewController: CalendarSelectionDelegate {
    func didSelectDate(_ date: Date) {
        debugPrint(date)
        guard let eventViewController = CalendarEventSetterViewController.initiateVC() else { return }
        eventViewController.delegate = self
        eventViewController.selectedDate = date
        self.present(eventViewController, animated: true, completion: nil)
    }
}

// MARK: - Add Ebvent Delegate
extension ViewController: AddNewEventDelegate {
    func addEvent(time: Date, title: String, remindBefore: RemindBefore) {
        debugPrint(time, title, remindBefore)
    }
}
