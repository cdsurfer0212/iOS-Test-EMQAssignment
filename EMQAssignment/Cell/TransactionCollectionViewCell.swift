//
//  TransactionCollectionViewCell.swift
//  EMQAssignment
//
//  Created by Sean Zeng on 6/25/16.
//  Copyright © 2016 Yahoo. All rights reserved.
//

import UIKit
import AppDevKit

let transactionCollectionViewCellIdentifier = "TransactionCollectionViewCell"

class TransactionCollectionViewCell: ADKCollectionViewDynamicSizeCell {
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var noteLabel: UILabel!
    @IBOutlet weak var recipientLabel: UILabel!
    @IBOutlet weak var senderLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setupShadow()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    
        setupShadow()
    }
    
    private func setupShadow() {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.ADKColorWithHexString("000000", alpha: 0.15).CGColor
        self.layer.shadowOffset = CGSizeMake(2.0, 2.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).CGPath
        self.layer.shadowRadius = 1.5
        
        // for performance issue
        self.layer.rasterizationScale = UIScreen.mainScreen().scale
        self.layer.shouldRasterize = true
    }
}

