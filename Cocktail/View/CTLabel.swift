//
//  CTLabel.swift
//  Cocktail
//
//  Created by Ali Demirtaş on 29.09.2022.
//

import UIKit

class CTLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(textAlignment: NSTextAlignment, fontSize: CGFloat, weight: UIFont.Weight, textColor: UIColor) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: weight)
        self.textColor = textColor
        configure()
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.90
        numberOfLines = 0
        lineBreakMode = .byWordWrapping
    }
}
