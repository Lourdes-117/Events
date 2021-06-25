//
//  CalendarDayCollectionViewCell.swift
//  Events
//
//  Created by Lourdes on 6/24/21.
//

import UIKit

class CalendarDayCollectionViewCell: UICollectionViewCell {
// MARK: - Outlet
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var title: UILabel!
    
    let viewModel = CalendarDayCollectionViewModel()
    
// MARK: - Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func conFigureCell(_ dayNumber: String, date: Date) {
        title.text = viewModel.getMonthStringTitle(dayNumber, date)
        dateLabel.text = dayNumber
    }
}
