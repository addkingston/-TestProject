//
//  MainVC.swift
//  test
//
//  Created by MacBook on 02.07.2022.
//

import UIKit

class MainController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.addSubview(contentView)
    }
    
    lazy var contentView: MainView = {
        let view = MainView(frame: view.frame)
        return view
    }()
}
