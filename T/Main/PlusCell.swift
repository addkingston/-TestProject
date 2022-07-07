import UIKit

class PlusCell: UICollectionViewCell {
    let screen = UIScreen.main.bounds
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(plusImageView)
    }
    
    lazy var plusImageView: UIImageView = {
        let img = UIImageView()
        img.frame = CGRect(x: frame.width / 2 - 27, y: frame.height / 2 - 27, width: 54, height: 54)
        img.image = UIImage(named: "plus")
        img.contentMode = .scaleAspectFill
        img.alpha = 1.0
        return img
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
