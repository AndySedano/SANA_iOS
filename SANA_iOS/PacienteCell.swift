//
//  PacienteCell.swift
//  SANA_iOS
//
//  Andres E. Sedano A00399842
//  Josué Adán Crisóstomo A01333760
//  Copyright © 2015 Andres Sedano. All rights reserved.
//

import UIKit

class PacienteCell: UITableViewCell {
    
    @IBOutlet weak var nombreLabel: UILabel!
    @IBOutlet weak var apellidoLabel: UILabel!
    @IBOutlet weak var fragilidadLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
