//
//  CalendarMonthViewController.swift
//  Events
//
//  Created by Lourdes on 6/26/21.
//

import UIKit

class CalendarMonthViewController: UIViewController {
// MARK: - Outlets
    @IBOutlet weak var calendarView: CalendarMonthCollectionView!
    
    var delegate: CalendarSelectionDelegate?
    
    var dateToSet: Date = Date()
    
// MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initialSetup()
    }
    
    private func initialSetup() {
        calendarView.configureWithDate(dateToSet)
        calendarView.delegate = delegate
    }
    
    func configureViewController(date: Date) {
        dateToSet = date
    }
}
