import UIKit

struct Recepient {
    var name: String = ""
    var image: String = ""
}

class RecepientsCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    let screen = UIScreen.main.bounds
    
    var recepients: [Recepient] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        
        addSubview(titleLabel)
        addSubview(sendButton)
        
        recepients = [Recepient(name: "", image: ""), Recepient(name: "Mike", image: "mike"), Recepient(name: "Joseph", image: "joseph"), Recepient(name: "Mike 2", image: "mike")]
        
        setupCollectionView()
    }
    
    // MARK: Logout Button
    
    lazy var sendButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .clear
        btn.frame = CGRect(x: UIScreen.main.bounds.width - 65, y: -3, width: 50, height: 50)
        btn.setImage(UIImage(named: "send")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.imageView?.tintColor = .darkTextColor
        btn.imageEdgeInsets = UIEdgeInsets(top: 14, left: 12, bottom: 12, right: 14)
        btn.imageView?.contentMode = .scaleAspectFill
        btn.imageView?.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        btn.addTarget(self, action: #selector(animateTouchDown3), for: .touchDown)
        btn.addTarget(self, action: #selector(animateRelease3), for: [.touchDragExit, .touchUpInside, .touchCancel])
        return btn
    }()
    
    @objc func animateTouchDown3() {
        UIView.animate(withDuration: 0.15) {
            self.sendButton.transform = CGAffineTransform.init(scaleX: 0.85, y: 0.85)
        }
    }
    
    @objc func animateRelease3() {
        UIView.animate(withDuration: 0.3) {
            self.sendButton.transform = .identity
        }
    }
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.frame = CGRect(x: 24, y: 0, width: screen.width - 16, height: 48)
        lbl.font = UIFont(name: "AvenirNext-DemiBold", size: 17)
        lbl.text = "Send Money"
        lbl.textColor = .darkTextColor
        return lbl
    }()
    
    lazy var arrowView: UIImageView = {
        let img = UIImageView()
        img.frame = CGRect(x: screen.width - 32 - 20, y: 10, width: 24, height: 24)
        img.image = UIImage(named: "send")?.withRenderingMode(.alwaysTemplate)
        img.tintColor = .black
        img.contentMode = .scaleAspectFill
        img.alpha = 1.0
        return img
    }()
    
    //==================================================//
    //================= CollectionView =================//
    //==================================================//
    func setupCollectionView() {
        collectionView.register(PlusCell.self, forCellWithReuseIdentifier: "PlusCell")
        collectionView.register(RecepientCell.self, forCellWithReuseIdentifier: "RecepientCell")
        
        collectionView.dataSource = self
        collectionView.delegate = self
        addSubview(collectionView)
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 1
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = CGSize(width: 104, height: 124)
        let frame = CGRect(x: 0, y: 54,
                           width: UIScreen.main.bounds.width,
                           height: 132)
        let collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        collectionView.alwaysBounceHorizontal = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delaysContentTouches = false
        return collectionView
    }()
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlusCell", for: indexPath) as! PlusCell
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecepientCell", for: indexPath) as! RecepientCell
            
            cell.recepient = recepients[indexPath.item]
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionView {
            return recepients.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 0 {
            return CGSize(width: 80, height: 80)
        } else {
            return CGSize(width: 104, height: 124)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
