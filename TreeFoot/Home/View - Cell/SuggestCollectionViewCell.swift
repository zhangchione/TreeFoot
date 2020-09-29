//
//  SuggestCollectionViewCell.swift
//  TreeFoot
//
//  Created by zhangchi on 2020/9/16.
//  Copyright © 2020 Hut. All rights reserved.
//

import UIKit

// TODO 建议补充Cell
let suggestId = "reusedcell"
let Frame = UIScreen.main.bounds
let Width = Frame.width
let Height = Frame.height
class SuggestCollectionViewCell: HomeBaseCollectionViewCell {
    
    
    var cellCallBack: ((Suggest) -> ())?
    
    var datas = [Suggest]()
    public func updateUI(with data: [Suggest]){
        self.datas = data
        self.collectionView.reloadData()
    }
    
    private var data = [
        Pattern(image: "SuggestCollection-1", name: "乳清蛋白粉"),
        Pattern(image: "SuggestCollection-2", name: "维生素C"),
    ]
    
    lazy var daily: UILabel = {
        let label = UILabel()
        let attrString = NSMutableAttributedString(string: "建议补充")
        label.frame = CGRect(x: 15.fit, y: 264.fit, width: 86.fit, height: 28.fit)
        label.numberOfLines = 0
        let attr: [NSAttributedString.Key : Any] = [.font: UIFont(name: "PingFang SC", size: 20)!,.foregroundColor: UIColor(red: 0.33, green: 0.33, blue: 0.33,alpha:1), ]
        attrString.addAttributes(attr, range: NSRange(location: 0, length: attrString.length))
        label.attributedText = attrString
        label.alpha = 1;
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let colletcionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        colletcionView.backgroundColor = .clear
        colletcionView.dataSource = self as UICollectionViewDataSource
        colletcionView.delegate = self as UICollectionViewDelegate
        colletcionView.register(NewSuggestControllerViewCell.classForCoder(), forCellWithReuseIdentifier: suggestId)
        colletcionView.showsVerticalScrollIndicator = false
        return colletcionView
    }()
    
    private func configUI(){
        self.backgroundColor = .white
        addSubview(collectionView)
        collectionView.snp.makeConstraints{ (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalTo(self).offset(50.fit)
            make.bottom.equalToSuperview().offset(-5.fit)
        }
        titleLabel.text = "建议补充"
    }
}


extension SuggestCollectionViewCell: UICollectionViewDataSource,UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: suggestId, for: indexPath) as! NewSuggestControllerViewCell
        cell.updateUI(with: datas[indexPath.row])
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let callback = self.cellCallBack {
            print("建议cell回调")
            callback(datas[indexPath.row])
        }
    }
    
    
}

extension SuggestCollectionViewCell: UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CFWidth, height: 100.fit)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20.fit
    }
    
}

