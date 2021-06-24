//
//  ViewController.swift
//  Events
//
//  Created by Lourdes on 6/24/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var calendarView: CalendarMonthCollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        calendarView.configure()
    }

    @IBAction func onTapNextButton(_ sender: Any) {
        calendarView.viewModel.selectedDate = calendarView.viewModel.selectedDate.nextMonth?.toLocalTime() ?? Date()
        calendarView.setMonths()
    }
    
}

