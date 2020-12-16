//
//  BasicTableViewCell.swift
//  Homework2
//
//  Created by Sasha on 16/12/2020.
//

import UIKit

class BasicTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.isSelected = false
    }

}
