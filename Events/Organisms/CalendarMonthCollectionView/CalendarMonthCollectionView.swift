//
//  CalendarMonthCollectionView.swift
//  Events
//
//  Created by Lourdes on 6/24/21.
//

import UIKit

class CalendarMonthCollectionView: UIView {
// MARK: - Outlets and Properties
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewHeightConstraint: NSLayoutConstraint!
    
    let viewModel = CalendarMonthCollectionViewModel()
    
    weak var delegate: CalendarSelectionDelegate?
    
// MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        commonInit(viewModel.kIdentifier)
    }
    
    func configureWithDate(_ date: Date) {
        viewModel.selectedDate = date
        setupValues()
        registerCells()
        setupCellSize()
        setupDatasourceDelegate()
    }
    
    private func registerCells() {
        let dateCell = UINib(nibName: viewModel.dateCellIdentifier, bundle: Bundle.main)
        collectionView.register(dateCell, forCellWithReuseIdentifier: viewModel.dateCellIdentifier)
    }
    
    private func setupCellSize() {
        let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        flowLayout?.itemSize = viewModel.getCellSizeForCollectionViewWidth(collectionView.frame.width)
        layoutIfNeeded()
    }
    
    private func setupDatasourceDelegate() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func setupValues() {
        viewModel.totalDays.removeAll()
        let daysInMonth = viewModel.selectedDate.daysInMonth ?? 0
        let daysInMonthBeforeFirstDay = viewModel.selectedDate.daysBeforeFirstDayOfMonth ?? 0
        for _ in 1...daysInMonthBeforeFirstDay {
            viewModel.totalDays.append("")
        }
        for date in 1...daysInMonth {
            viewModel.totalDays.append(date.description)
        }
        collectionView.reloadData()
    }
}


// MARK: - CollectionView Datasource
extension CalendarMonthCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.totalDays.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: viewModel.dateCellIdentifier, for: indexPath) as? CalendarDayCollectionViewCell else { return UICollectionViewCell() }
            cell.conFigureCell(viewModel.totalDays[indexPath.row], date: viewModel.selectedDate)
        return cell
    }
}

// MARK: - CollectionView Datasource
extension CalendarMonthCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let daySelected = (indexPath.row + 1) - (viewModel.selectedDate.daysBeforeFirstDayOfMonth ?? 0)
        var dateComponent = DateComponents()
        guard daySelected > 0 else { return }
        dateComponent.day = (daySelected - viewModel.selectedDate.date)
        let dateSelectedd = Calendar.current.date(byAdding: dateComponent, to: viewModel.selectedDate) ?? Date()
        delegate?.didSelectDate(dateSelectedd)
    }
}
