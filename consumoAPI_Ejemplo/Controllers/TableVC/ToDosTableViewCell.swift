//
//  ToDosTableViewCell.swift
//  consumoAPI_Ejemplo
//
//  Created by Artemio on 09/09/21.
//

import UIKit

class ToDosTableViewCell: UITableViewCell {

    @IBOutlet weak var LBL_TileLabel: UILabel!
    @IBOutlet weak var LBL_IdLabel: UILabel!
    @IBOutlet weak var V_ActivationView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func assignToDosData(_ todos: ToDos){
        LBL_TileLabel.text = todos.title
        LBL_IdLabel.text = String(describing: todos.id ?? 0)
    }
    
}
