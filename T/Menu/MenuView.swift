import UIKit

class MenuView: UIView {
    let screen = UIScreen.main.bounds
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .blue
        addSubviews()
        setUpConstraints()
    }
    
    func addSubviews() {
        addSubview(tableView)
        addSubview(logoutButton)
        addSubview(logoutLabel)
        
        addSubview(hideMenuButton)
        
        addSubview(userView)
        userView.addSubview(userImageView)
        userView.addSubview(titleLabel)
        userView.addSubview(subtitleLabel)
        
        setupTableView()
    }
    
    lazy var userView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 218, height: 110)
        view.roundCorners([.bottomRight], radius: 54)
        view.backgroundColor = UIColor(red: 23/255, green: 24/255, blue: 34/255, alpha: 1.0)
        return view
    }()
    
    lazy var userImageView: UIImageView = {
        let img = UIImageView()
        img.frame = CGRect(x: 24, y: 69 - 22, width: 44, height: 44)
        img.image = UIImage(named: "carol")
        img.contentMode = .scaleAspectFill
        img.alpha = 1.0
        return img
    }()
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.frame = CGRect(x: 80, y: 74 - 22, width: screen.width - 16, height: 20)
        lbl.font = UIFont(name: "AvenirNext-DemiBold", size: 17)
        lbl.text = "Carol Black"
        lbl.textColor = .white
        return lbl
    }()
    
    lazy var subtitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.frame = CGRect(x: 80, y: 92 - 22, width: screen.width - 16, height: 20)
        lbl.font = UIFont(name: "AvenirNext-Regular", size: 11)
        lbl.text = "Seattle, Washington"
        lbl.textColor = UIColor(red: 123/255, green: 127/255, blue: 158/255, alpha: 1.0)
        return lbl
    }()
    
    func setUpConstraints() {
        logoutButton.frame = CGRect(x: 16, y: screen.height - 90, width: 44, height: 44)
        logoutLabel.frame = CGRect(x: 60, y: screen.height - 80, width: 100, height: 22)
    }
    
    @objc func animateMenu() {
        tableView.reload()
    }
    
    // MARK: Logout Button
    lazy var hideMenuButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .clear
        btn.frame = CGRect(x: UIScreen.main.bounds.width - 116, y: 74 - 52, width: 100, height: 100)
        btn.layer.cornerRadius = 10
        btn.layer.masksToBounds = true
        btn.setImage(UIImage(named: "close")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.imageView?.tintColor = .white
        btn.imageEdgeInsets = UIEdgeInsets(top: 42, left: 56, bottom: 42, right: 42 - 14)
        btn.imageView?.contentMode = .scaleAspectFill
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
    
    lazy var logoutButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .clear
        btn.layer.cornerRadius = 10
        btn.layer.masksToBounds = true
        btn.setImage(UIImage(named: "logout")?.withTintColor(.white), for: .normal)
        btn.imageEdgeInsets = UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.addTarget(self, action: #selector(animateTouchDown2), for: .touchDown)
        btn.addTarget(self, action: #selector(animateRelease2), for: [.touchDragExit, .touchUpInside, .touchCancel])
        return btn
    }()
    
    lazy var logoutLabel: UILabel = {
        let lbl = UILabel()
//        lbl.frame = CGRect(x: 100, y: 74 - 16, width: screen.width - 16, height: 20)
        lbl.font = UIFont(name: "AvenirNext-DemiBold", size: 17)
        lbl.text = "Logout"
        lbl.textColor = .white
        lbl.textAlignment = .center
        return lbl
    }()
    
    
    
    @objc func animateTouchDown2() {
        UIView.animate(withDuration: 0.15) {
            self.logoutButton.transform = CGAffineTransform.init(scaleX: 0.85, y: 0.85)
            self.logoutLabel.transform = CGAffineTransform.init(scaleX: 0.85, y: 0.85)
        }
    }
    
    @objc func animateRelease2() {
        UIView.animate(withDuration: 0.3) {
            self.logoutButton.transform = .identity
            self.logoutLabel.transform = .identity
        }
    }
    
    // MARK: UITableView
    
    func setupTableView() {
        tableView.register(MenuCell.self, forCellReuseIdentifier: "MenuCell")
        
        tableView.separatorStyle = .none
        tableView.direction = .inPlaceFadeInTop
        tableView.isEnabled = true
        tableView.duration = 1.1
        tableView.delay = 0.06
        tableView.springDamping = 0.6
        tableView.springValocity = 1
        tableView.alpha = 0.0
        
    }
    
    lazy var tableView: TanibleView = {
        let frame = CGRect(x: 0, y: 214 - 45, width: screen.width, height: 480)
        let tableView = TanibleView(frame: frame)
        tableView.backgroundColor = .clear
        tableView.alwaysBounceVertical = true
        tableView.contentInset = UIEdgeInsets(top: 46, left: 0, bottom: 32, right: 0)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsVerticalScrollIndicator = false
        tableView.isPagingEnabled = false
        tableView.estimatedRowHeight = 60
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MenuController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
        cell.menuItem = menuItems[indexPath.row]
        let backgroundView = UIView()
        backgroundView.backgroundColor = .lightBlue
        cell.selectedBackgroundView = backgroundView
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        view.endEditing(true)
        
        self.showMenu()
        
        
        let vc = CVTestVC() // UIViewController()
        vc.view.backgroundColor = .darkBlue
        vc.title = self.menuItems[indexPath.item].title
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.tintColor = .white
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.30) {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
