//
//  InfoCell.swift
//  e-Bookee
//
//  Created by Admin on 14.12.2021.
//

import UIKit

class MainView: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    let screen = UIScreen.main.bounds
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .darkBlue
    
        setupCollectionView()
        addSubview(headerView)
        headerView.addSubview(arrowView)
        headerView.addSubview(titleLabel)
        
        headerView.addSubview(menuIcon)
        headerView.addSubview(menuButton)
    }
    
    lazy var headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkBlue
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 108)
        return view
    }()
    
    lazy var arrowView: UIImageView = {
        let img = UIImageView()
        img.frame = CGRect(x: 25, y: 26, width: 50, height: 50)
        img.image = UIImage(named: "logo")
        img.contentMode = .scaleAspectFit
        img.alpha = 1.0
        return img
    }()
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.frame = CGRect(x: 85, y: 26, width: 100, height: 48)
        lbl.font = UIFont(name: "Ubuntu-Medium", size: 29)
        lbl.text = "eWalle"
        lbl.textColor = .white
        return lbl
    }()
    
    lazy var menuButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: screen.width - 100, y: 0, width: 100, height: 100)
        button.addTarget(self, action: #selector(showMenu), for: .touchUpInside)
        button.addTarget(self, action: #selector(animateTouchDownMenu), for: .touchDown)
        button.addTarget(self, action: #selector(animateReleaseMenu), for: [.touchDragExit, .touchUpInside, .touchCancel])
        return button
    }()
    
    @objc func showMenu() {
        NotificationCenter.default.post(name: .showMenu, object: nil)
    }
    
    @objc func animateTouchDownMenu(sender: UIButton) {
        UIView.animate(withDuration: 0.22, delay: 0, usingSpringWithDamping: 0.85, initialSpringVelocity: 0.25, options: .curveEaseInOut, animations: {
            self.menuIcon.transform = CGAffineTransform(scaleX: 0.84, y: 0.84)
        })
    }
    
    @objc func animateReleaseMenu(sender: UIButton) {
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.85, initialSpringVelocity: 0.25, options: .curveEaseInOut, animations: {
            self.menuIcon.transform = CGAffineTransform.identity
        })
    }
    
    lazy var menuIcon: UIImageView = {
        let img = UIImageView()
        img.frame = CGRect(x: UIScreen.main.bounds.width - 46, y: 40, width: 19, height: 19)
        img.image = UIImage(named: "Union")?.withRenderingMode(.alwaysTemplate)
        img.tintColor = .darkTextColor
        img.contentMode = .scaleAspectFill
        img.alpha = 1.0
        return img
    }()
    
    
    // MARK: UICollectionView
    
    func setupCollectionView() {
        collectionView.register(HeaderCell.self, forCellWithReuseIdentifier: "HeaderCell")
        collectionView.register(RecepientsCell.self, forCellWithReuseIdentifier: "RecepientsCell")
        collectionView.register(ServicesCell.self, forCellWithReuseIdentifier: "ServicesCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        addSubview(collectionView)
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.scrollDirection = .vertical
        let frame = CGRect(x: 0, y: 0,
                           width: UIScreen.main.bounds.width,
                           height: screen.height)
        let collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.alwaysBounceHorizontal = false
        collectionView.alwaysBounceVertical = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delaysContentTouches = false
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.item{
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeaderCell", for: indexPath) as! HeaderCell
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecepientsCell", for: indexPath) as! RecepientsCell
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ServicesCell", for: indexPath) as! ServicesCell
            return cell
        default:
            break
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 0 {
            return CGSize(width: screen.width,
                          height: 270)
        } else if indexPath.item == 1 {
            return CGSize(width: screen.width,
                          height: 212)
        } else if indexPath.item == 2 {
            return CGSize(width: screen.width,
                          height: 310)
        }
        
        return CGSize(width: screen.width,
                      height: screen.height + 300)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
