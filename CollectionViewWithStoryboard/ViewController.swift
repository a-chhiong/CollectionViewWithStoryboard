//
//  ViewController.swift
//  CollectionViewWithStoryboard
//
//  Created by Frank.Chen on 2018/1/13.
//  Copyright © 2018年 frank.chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myCollView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let myCollViewLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        //myCollViewLayout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10) // section與section之間的距離
        //myCollViewLayout.itemSize = CGSize(width: (self.view.frame.size.width - 30) / 2, height: 120) // cell的寬、高
        //myCollViewLayout.minimumLineSpacing = CGFloat(integerLiteral: 10) // collectionView設定為縱向的話即「行」的間距、橫向則為「列」的間距
        //myCollViewLayout.minimumInteritemSpacing = CGFloat(integerLiteral: 10) // collectionView設定為縱向的話即「列」的間距、橫向則為「行」的間距
        myCollViewLayout.scrollDirection = UICollectionViewScrollDirection.vertical // 滑動方向，預設為垂直。注意若設為垂直，則cell的加入方式為由左至右，滿了才會換行；若是水平則由上往下，滿了才會換列
    
        let nib = UINib(nibName: "MyCollectionViewCell", bundle: nil)
        self.myCollView.register(nib, forCellWithReuseIdentifier: "MyCollectionViewCell")
        self.myCollView.setCollectionViewLayout(myCollViewLayout, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: UICollectionViewDataSource {
    
    /// 設定 CollectionViewCell
    ///
    /// - Parameters:
    ///   - collectionView: _
    ///   - indexPath: _
    /// - Returns: _
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell", for: indexPath) as! MyCollectionViewCell
        
        // 設定背景色
        cell.backgroundColor = indexPath.row % 2 == 0 ? UIColor.green : UIColor.red
        
        // 改變Label的文字內容
        cell.mylabel.text = "Item: \(indexPath.item)";
        
        return cell
    }
    
    /// 設定有幾個 CollectionViewCell 在 CollectionView 裡
    ///
    /// - Parameters:
    ///   - collectionView: _
    ///   - section: _
    /// - Returns: _
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
}


// MARK: - 設定 CollectionView Cell 與 Cell 之間的間距、距確 Super View 的距離等等
extension ViewController: UICollectionViewDelegateFlowLayout {
    
    /// 設定 Collection View 距離 Super View上、下、左、下間的距離
    ///
    /// - Parameters:
    ///   - collectionView: _
    ///   - collectionViewLayout: _
    ///   - section: _
    /// - Returns: _
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    ///  設定 CollectionViewCell 的寬、高
    ///
    /// - Parameters:
    ///   - collectionView: _
    ///   - collectionViewLayout: _
    ///   - indexPath: _
    /// - Returns: _
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.view.frame.size.width - 30) / 2 , height: (self.view.frame.size.height - 30) / 4)
    }
    
    /// 滑動方向為「垂直」的話即「上下」的間距(預設為垂直)
    ///
    /// - Parameters:
    ///   - collectionView: _
    ///   - collectionViewLayout: _
    ///   - section: _
    /// - Returns: _
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    /// 滑動方向為「垂直」的話即「左右」的間距(預設為垂直)
    ///
    /// - Parameters:
    ///   - collectionView: _
    ///   - collectionViewLayout: _
    ///   - section: _
    /// - Returns: _
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
