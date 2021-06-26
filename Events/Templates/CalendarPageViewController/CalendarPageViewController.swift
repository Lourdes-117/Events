//
//  CalendarPageViewController.swift
//  Events
//
//  Created by Lourdes on 6/26/21.
//

import UIKit

class CalendarPageViewController: UIPageViewController {
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: .vertical, options: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(transitionStyle: .scroll, navigationOrientation: .vertical, options: nil)
    }
    
    let viewModel = CalendarPageViewControllerViewModel()
    
    weak var calendarSelectionDelegate: CalendarSelectionDelegate?
    
// MARK: -  Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    func initialSetup() {
        self.dataSource = self
        self.delegate = self
        
        
        guard let viewController = CalendarMonthViewController.initiateVC() else { return }
        viewController.configureViewController(date: viewModel.date)
        viewController.delegate = calendarSelectionDelegate
        self.setViewControllers([viewController], direction: .reverse, animated: true, completion: nil)
    }
}

// MARK: - UIPageViewController Datasource
extension CalendarPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let dateToSet = (viewController as? CalendarMonthViewController)?.dateToSet.previousMonth
        viewModel.date = dateToSet ?? Date()
        guard let previousViewController = CalendarMonthViewController.initiateVC() else { return nil }
        previousViewController.configureViewController(date: viewModel.date)
        previousViewController.delegate = calendarSelectionDelegate
        return previousViewController
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let dateToSet = (viewController as? CalendarMonthViewController)?.dateToSet.nextMonth
        viewModel.date = dateToSet ?? Date()
        guard let nextViewController = CalendarMonthViewController.initiateVC() else { return nil }
        nextViewController.configureViewController(date: viewModel.date)
        nextViewController.delegate = calendarSelectionDelegate
        return nextViewController
    }
}

// MARK: - UIPageViewController Delegate
extension CalendarPageViewController: UIPageViewControllerDelegate {
    
}
