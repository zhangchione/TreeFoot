//
//  RecipeDetailViewController.swift
//  TreeFoot
//
//  Created by zhangchi on 2020/9/16.
//  Copyright © 2020 Hut. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController {
    
    var datas = DayRecommend()
    convenience init(data:DayRecommend) {
        self.init()
        self.datas = data
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        configNavbar()
        // Do any additional setup after loading the view.
    }
    
    func configUI() {
        self.view.backgroundColor = .white
        //self.navigationItem.title = self.datas.name
    }
    
    func configNavbar() {
        self.navigation.bar.isShadowHidden = true
        self.navigation.bar.alpha = 0
    }

}
