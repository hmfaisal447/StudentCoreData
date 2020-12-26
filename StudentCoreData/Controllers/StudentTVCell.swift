//
//  StudentTVCell.swift
//  StudentCoreData
//
//  Created by codegradients on 26/12/2020.
//

import UIKit

class StudentTVCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblMobile: UILabel!
    
    var student: Student! {
        didSet {
            lblName.text = student.name
            lblAddress.text = student.address
            lblCity.text = student.city
            lblMobile.text = student.mobile
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
