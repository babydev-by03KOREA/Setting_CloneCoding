
import UIKit

class MenuCell: UITableViewCell {

    @IBOutlet weak var rightImageView: UIImageView!
    
    @IBOutlet weak var middleTitle: UILabel!
    
    @IBOutlet weak var leftImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
}
