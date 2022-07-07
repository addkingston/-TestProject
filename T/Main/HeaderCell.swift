import UIKit

class HeaderCell: UICollectionViewCell {
    let screen = UIScreen.main.bounds
    
//    var specialist: Specialist? {
//        didSet {
//            if let image = specialist?.imageUrl {
//                print(image)
//            }
//
//            if let title = specialist?.title {
//                print(title)
//            }
//        }
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(titleLabel)
        addSubview(balanceView)
        balanceView.addSubview(balanceLabel)
        balanceView.addSubview(descriptionLabel)
        
        addSubview(plusButton)
    }
    
    lazy var balanceView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 24, y: 120, width: UIScreen.main.bounds.width - 50, height: 120)
        view.layer.cornerRadius = 12
        view.backgroundColor = .blue
        return view
    }()
    
    lazy var balanceLabel: UILabel = {
        let lbl = UILabel()
        lbl.frame = CGRect(x: 27, y: 27, width: balanceView.frame.width - 120, height: 37)
        lbl.font = UIFont(name: "AvenirNext-DemiBold", size: 25)
        lbl.text = "20,600"
        lbl.textColor = .white
        return lbl
    }()
    
    lazy var descriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.frame = CGRect(x: 27, y: 73, width: 100, height: 20)
        lbl.font = UIFont(name: "AvenirNext-Regular", size: 13)
        lbl.text = "Current balance"
        lbl.textColor = .darkTextColor
        return lbl
    }()
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.frame = CGRect(x: 24, y: 62, width: screen.width - 16, height: 48)
        lbl.font = UIFont(name: "AvenirNext-DemiBold", size: 17)
        lbl.text = "Account Overview"
        lbl.textColor = .darkTextColor
        return lbl
    }()
    
    lazy var plusButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .clear
        btn.frame = CGRect(x: UIScreen.main.bounds.width - 102, y: 155, width: 50, height: 50)
        btn.layer.cornerRadius = 10
        btn.layer.masksToBounds = true
        btn.setImage(UIImage(named: "plus"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFill
        btn.imageView?.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        btn.addTarget(self, action: #selector(animateTouchDown3), for: .touchDown)
        btn.addTarget(self, action: #selector(animateRelease3), for: [.touchDragExit, .touchUpInside, .touchCancel])
        return btn
    }()
    
    @objc func animateTouchDown3() {
        UIView.animate(withDuration: 0.15) {
            self.plusButton.transform = CGAffineTransform.init(scaleX: 0.85, y: 0.85)
        }
    }
    
    @objc func animateRelease3() {
        UIView.animate(withDuration: 0.3) {
            self.plusButton.transform = .identity
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
