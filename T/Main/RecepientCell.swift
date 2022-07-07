import UIKit

class RecepientCell: UICollectionViewCell {
    let screen = UIScreen.main.bounds
    
    var recepient: Recepient? {
        didSet {
            if let image = recepient?.image {
                self.recepientImageView.image = UIImage(named: image)
            }
            
            if let name = recepient?.name {
                nameLabel.text = name
            }
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
        layer.borderColor = UIColor.lightBlue.cgColor
        layer.borderWidth = 2
        layer.cornerRadius = 12
        
        addSubview(bgView)
        addSubview(recepientImageView)
        addSubview(nameLabel)
    }
    
    lazy var bgView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 28, y: 21, width: 48, height: 48)
        view.layer.cornerRadius = 24
        view.layer.masksToBounds = true
        view.layer.borderColor = UIColor.lightBlue.cgColor
        view.layer.borderWidth = 2
        view.backgroundColor = UIColor.darkBlue
        return view
    }()
    
    
    lazy var recepientImageView: UIImageView = {
        let img = UIImageView()
        img.frame = CGRect(x: self.frame.width / 2 - 21, y: 25, width: 42, height: 42)
        img.image = UIImage(named: "joseph")
        img.contentMode = .scaleAspectFill
        img.alpha = 1.0
        
//        Color.darkBlue
        
        return img
    }()
    
    lazy var nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.frame = CGRect(x: 35, y: 83, width: 100, height: 20)
        lbl.font = UIFont(name: "AvenirNext-Regular", size: 13)
        lbl.text = "Mike"
        lbl.textColor = .darkTextColor
        return lbl
    }()
      
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

