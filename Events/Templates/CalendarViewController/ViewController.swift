//
//  ViewController.swift
//  Events
//
//  Created by Lourdes on 6/24/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = CalendarViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initialSetup()
    }
    
    private func initialSetup() {
        registerCells()
        setupDatasourceDelegate()
    }
    
    private func registerCells() {
        let calendarMonthCell = UINib(nibName: viewModel.calendarTableViewCellIdentifier, bundle: Bundle.main)
        tableView.register(calendarMonthCell, forCellReuseIdentifier: viewModel.calendarTableViewCellIdentifier)
    }
    
    private func setupDatasourceDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: - TableView DataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.calendarTableViewCellIdentifier, for: indexPath) as? CalendarMonthTableViewCell else{ return UITableViewCell() }
        cell.configureCell(date: viewModel.currentDate)
        viewModel.currentDate = viewModel.currentDate.nextMonth ?? Date()
        return cell
    }
}

// MARK: - TableView Delegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        viewModel.getTableViewCellHeightForWidth(tableView.frame.width, date: viewModel.currentDate)
    }
}
