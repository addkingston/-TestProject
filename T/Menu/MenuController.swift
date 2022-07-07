import UIKit

class MenuController: UIViewController {
    let screen = UIScreen.main.bounds
    
    private lazy var contentView = MenuView()
    
    var menuItems = [MenuItem(id: 0, title: "Home"),
                 MenuItem(id: 1, title: "Profile"),
                 MenuItem(id: 2, title: "Accounts"),
                 MenuItem(id: 3, title: "Transactions"),
                 MenuItem(id: 4, title: "Stats"),
                 MenuItem(id: 5, title: "Settings"),
                 MenuItem(id: 6, title: "Help")]
    
    var mainVC: UIViewController = MainController()
    var isMinimized = false
    var minimizedTransform = CGAffineTransform(scaleX: 0.685, y: 0.685).concatenating(CGAffineTransform(translationX: 178, y: 50)).concatenating(CGAffineTransform(rotationAngle: -0.26))

    init() {
        super.init(nibName: nil, bundle: nil)
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func loadView() {
        view = contentView
        contentView.tableView.delegate = self
        contentView.tableView.dataSource = self
//        contentView.tableView.backgroundColor = .red
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
//        view.backgroundColor = .black
        
//        updateUserLabels()
        
        mainVC.view.layer.cornerRadius = 40
        mainVC.view.layer.masksToBounds = true
        
        add(mainVC, frame: view.frame)
        
        setupTargets()
        setupBindings()
        
    }
    
    func setupTargets() {
        closeMenuButton.addTarget(self, action: #selector(touchDown), for: .touchDown)
        closeMenuButton.addTarget(self, action: #selector(touchRelease), for: [.touchCancel, .touchDragExit])
        closeMenuButton.addTarget(self, action: #selector(showMenu), for: .touchUpInside)
        contentView.hideMenuButton.addTarget(self, action: #selector(showMenu), for: .touchUpInside)
        
//        contentView.profileButton.addTarget(self, action: #selector(showProfile), for: .touchUpInside)
//        contentView.logoutButton.addTarget(self, action: #selector(logout), for: .touchUpInside)
    }
    
    
    func setupBindings() {
        NotificationCenter.default.addObserver(self, selector: #selector(showMenu), name: .showMenu, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(finishLogin), name: .finishLogin, object: nil)
    }
    
    var closeMenuButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: UIScreen.main.bounds.width - 210, y: 110, width: 210, height: UIScreen.main.bounds.height - 220)
//        button.backgroundColor = UIColor.red.withAlphaComponent(0.1)
        return button
    }()
    
    @objc func showMenu() {
        if isMinimized {
            UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseInOut) {
//                self.contentView.menuDecorator.transform = .identity
                self.mainVC.view.transform = .identity
                self.closeMenuButton.removeFromSuperview()
            }
        } else {
            contentView.tableView.reload()
            UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseInOut) {
//                self.contentView.menuDecorator.transform = .identity
                self.mainVC.view.transform = self.minimizedTransform
                self.contentView.addSubview(self.closeMenuButton)
            }
        }
        isMinimized = !isMinimized
    }
    
    
    @objc func touchDown() {
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseInOut) {
            self.mainVC.view.transform = self.minimizedTransform.concatenating(CGAffineTransform(scaleX: 0.96, y: 0.96))
        } completion: { _ in

        }
    }
    
    @objc func touchRelease() {
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseInOut) {
            self.mainVC.view.transform = self.minimizedTransform
        } completion: { _ in

        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    @objc func finishLogin() { // TODO
//        updateUserLabels()
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
//            UIView.animate(withDuration: 0.3) {
//                self.contentView.userTitleLabel.isHidden = false
//                self.contentView.userSubtitleLabel.isHidden = false
//                self.contentView.nameLabel.isHidden = true
//            }
//        }
        
        // makes status bar black when splashscreen is hidden
        navigationController?.navigationBar.barStyle = .default
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
