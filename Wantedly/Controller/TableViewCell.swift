//
//  TableViewCell.swift
//  Wantedly
//
//  Created by 藤田優作 on 2021/03/05.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        ImageView.image = image
//        titleLabel.text = title
//        detailLabel.text = detail 
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
