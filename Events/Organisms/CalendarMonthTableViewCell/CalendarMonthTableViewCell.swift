//
//  CalendarMonthTableViewCell.swift
//  Events
//
//  Created by Lourdes on 6/25/21.
//

import UIKit

class CalendarMonthTableViewCell: UITableViewCell {
// MARK: - Outlets

    @IBOutlet weak var calendarMonthView: CalendarMonthCollectionView!
    
    var dateForCell: Date?
// MARK: - Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(date: Date) {
        calendarMonthView.configureWithDate(date)
        dateForCell = date
    }
    
}
