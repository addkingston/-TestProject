import UIKit

struct MenuItem {
    var id = 0
    var title = ""
}

class MenuCell: UITableViewCell {
    let screen = UIScreen.main.bounds
    
    var menuItem: MenuItem? {
        didSet {
            if let title = menuItem?.title {
                titleLabel.text = title
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear

        addSubview(titleLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        titleLabel.alpha = 1.0
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 30, y: 46 / 2 - 6, width: screen.width - 116, height: 20)
        label.font = UIFont(name: "AvenirNext-Medium", size: 17)
        label.textColor = .white
        return label
    }()
}
