//
//  MyTasksCell.swift
//  ToDoApp
//
//  Created by Abdulmajeed Shukayri on 18/12/2021.
//

import UIKit

class TodoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var taskTitle : UILabel!
    
    @IBOutlet weak var taskDate : UILabel!
    
    @IBOutlet weak var taskNote : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
