//
//  MainCell.swift
//  Cocktail
//
//  Created by Ali Demirtaş on 28.09.2022.
//

import UIKit

class MainCell: UICollectionViewCell {

    var cocktailImageView = CTImageView(frame: .zero)
    var cocktailLabel = CTLabel(textAlignment: .center, fontSize: 14,weight: .bold,textColor: .systemPurple)
    
    var bodyText = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(cocktail: Drinks, indexPath: Int) {
        cocktailLabel.text = cocktail.strDrink
        cocktailImageView.downloadImage(urlString: cocktail.strDrinkThumb)
        bodyText = cocktail.strDrinkThumb
    }
    
    private func configure() {
        addSubview(cocktailImageView)
        addSubview(cocktailLabel)
        cocktailLabel.text = "Margarita"
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            cocktailImageView.topAnchor.constraint(equalTo: topAnchor,constant: padding),
            cocktailImageView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: padding),
            cocktailImageView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -padding),
            cocktailImageView.heightAnchor.constraint(equalTo: cocktailImageView.widthAnchor),
            
            cocktailLabel.topAnchor.constraint(equalTo: cocktailImageView.bottomAnchor,constant: padding),
            cocktailLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: padding),
            cocktailLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -padding),
            cocktailLabel.heightAnchor.constraint(equalToConstant: 34),
        ])
    }
    
}
