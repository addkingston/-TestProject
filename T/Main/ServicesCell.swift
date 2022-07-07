import UIKit

struct ItemPhoto {
    var name: String = ""
    var image: String = ""
}

class ServicesCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    let screen = UIScreen.main.bounds
    
    var itemPhotos: [ItemPhoto] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(titleLabel)
        addSubview(hideMenuButton)
        
        itemPhotos = [ItemPhoto(name: "Receive Money", image: "receiveMoney"), ItemPhoto(name: "Receive Money", image: "receiveMoney"), ItemPhoto(name: "Mobile Prepaid", image: "mobilePrepaid"),ItemPhoto(name: "Electricity Bill", image: "electricityBill"), ItemPhoto(name: "Cashback Offer", image: "cashbackOffer"), ItemPhoto(name: "Movie Tickets", image: "movieTickets"), ItemPhoto(name: "Flight Tickets", image: "flightTickets"), ItemPhoto(name: "Union", image: "Union")]
        setupCollectionView()
    }
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.frame = CGRect(x: 24, y: 0, width: screen.width - 16, height: 48)
        lbl.font = UIFont(name: "AvenirNext-DemiBold", size: 17)
        lbl.text = "Services"
        lbl.textColor = .darkTextColor
        return lbl
    }()
    
    // MARK: Logout Button
    lazy var hideMenuButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .clear
        btn.frame = CGRect(x: UIScreen.main.bounds.width - 65, y: -3, width: 50, height: 50)
        btn.setImage(UIImage(named: "services")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.imageView?.tintColor = .darkTextColor
        btn.imageEdgeInsets = UIEdgeInsets(top: 15, left: 13, bottom: 11, right: 13)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.imageView?.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        btn.addTarget(self, action: #selector(animateTouchDown3), for: .touchDown)
        btn.addTarget(self, action: #selector(animateRelease3), for: [.touchDragExit, .touchUpInside, .touchCancel])
        return btn
    }()
    
    @objc func animateTouchDown3() {
        UIView.animate(withDuration: 0.15) {
            self.hideMenuButton.transform = CGAffineTransform.init(scaleX: 0.85, y: 0.85)
        }
    }
    
    @objc func animateRelease3() {
        UIView.animate(withDuration: 0.3) {
            self.hideMenuButton.transform = .identity
        }
    }
    
    //==================================================//
    //================= CollectionView =================//
    //==================================================//
    func setupCollectionView() {
        collectionView.register(ServiceCell.self, forCellWithReuseIdentifier: "ServiceCell")
        collectionView.register(RecepientCell.self, forCellWithReuseIdentifier: "RecepientCell")

        collectionView.dataSource = self
        collectionView.delegate = self
        addSubview(collectionView)
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 16
        layout.scrollDirection = .vertical
        let frame = CGRect(x: 0, y: 54,
                           width: UIScreen.main.bounds.width,
                           height: 300)
        let collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 11, bottom: 0, right: 13)
        collectionView.alwaysBounceHorizontal = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delaysContentTouches = false
        collectionView.isPagingEnabled = true
        return collectionView
    }()
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ServiceCell", for: indexPath) as! ServiceCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionView {
            return itemPhotos.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 90, height: 106)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
