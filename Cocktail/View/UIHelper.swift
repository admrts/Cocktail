//
//  UIHelper.swift
//  Cocktail
//
//  Created by Ali Demirtaş on 29.09.2022.
//
import UIKit

struct UIHelper {
    
    static func createThreeColumnLayout(in view: UIView) -> UICollectionViewFlowLayout {
        let width = view.bounds.width
        let padding: CGFloat = 12
        let minumumItemSpacing: CGFloat = 10
        let avaibleWidth = width - (padding * 2) - (minumumItemSpacing * 2)
        let itemWidth = avaibleWidth / 3
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)

        return flowLayout
    }
}
