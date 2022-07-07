import UIKit

class ServiceCell: UICollectionViewCell {
    let screen = UIScreen.main.bounds
    
    var itemPhoto: ItemPhoto? {
        didSet {
            if let image = itemPhoto?.image {
                self.menuIcon.image = UIImage(named: image)
            }
            
            if let name = itemPhoto?.name {
                descriptionLabel.text = name
            }
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        
        addSubview(view)
        view.addSubview(menuIcon)
        addSubview(descriptionLabel)
        UIView.animate(withDuration: 0.3, animations: {
//            self.image.transform = CGAffineTransform(translationX: -20, y: 0)
        }) { _ in
             
        }
    }
    
    lazy var view: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 14, y: 4, width: 62, height: 62)
        view.backgroundColor = .blue
        view.layer.borderColor = UIColor.lightBlue.cgColor
        view.layer.borderWidth = 2
        view.layer.cornerRadius = 12
        return view
    }()
    
    lazy var menuIcon: UIImageView = {
        let img = UIImageView()
        img.frame = CGRect(x: view.frame.width / 2 - 12, y: 19, width: 24, height: 24)
        img.image = UIImage(named: "receiveMoney")
        img.contentMode = .scaleAspectFill
        img.alpha = 1.0
        
        return img
    }()
    
    lazy var descriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.frame = CGRect(x: 0, y: 71, width: frame.width, height: 36)
        lbl.font = UIFont(name: "AvenirNext-DemiBold", size: 11)
        lbl.text = "Send\nMoney"
        lbl.textColor = .darkTextColor
//        lbl.backgroundColor = UIColor.green.withAlphaComponent(0.2)
        lbl.numberOfLines = 2
        lbl.textAlignment = .center
        return lbl
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

