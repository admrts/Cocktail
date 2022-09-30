//
//  DetailViewController.swift
//  Cocktail
//
//  Created by Ali Demirtaş on 29.09.2022.
//

import UIKit

class DetailViewController: UIViewController {

    let imageView = CTImageView(frame: .zero)
    let titleLabel = CTLabel(textAlignment: .center, fontSize: 20, weight: .bold,textColor: .black)
    let buttonImage = CTImageView(frame: .zero)
   
    
    let ingredientLabel = CTLabel(textAlignment: .center, fontSize: 15, weight: .heavy, textColor: .black)
    let measureLabel = CTLabel(textAlignment: .center, fontSize: 15, weight: .heavy, textColor: .black)
    
    // ingredient Labels
    let ingredient1 = CTLabel(textAlignment: .center, fontSize: 13, weight: .semibold, textColor: .black)
    let ingredient2 = CTLabel(textAlignment: .center, fontSize: 13, weight: .semibold, textColor: .black)
    let ingredient3 = CTLabel(textAlignment: .center, fontSize: 13, weight: .semibold, textColor: .black)
    let ingredient4 = CTLabel(textAlignment: .center, fontSize: 13, weight: .semibold, textColor: .black)
    let ingredient5 = CTLabel(textAlignment: .center, fontSize: 13, weight: .semibold, textColor: .black)
    let ingredient6 = CTLabel(textAlignment: .center, fontSize: 13, weight: .semibold, textColor: .black)
    let ingredient7 = CTLabel(textAlignment: .center, fontSize: 13, weight: .semibold, textColor: .black)
    
    // measure Labels
    
    let measure1 = CTLabel(textAlignment: .center, fontSize: 13, weight: .semibold, textColor: .black)
    let measure2 = CTLabel(textAlignment: .center, fontSize: 13, weight: .semibold, textColor: .black)
    let measure3 = CTLabel(textAlignment: .center, fontSize: 13, weight: .semibold, textColor: .black)
    let measure4 = CTLabel(textAlignment: .center, fontSize: 13, weight: .semibold, textColor: .black)
    let measure5 = CTLabel(textAlignment: .center, fontSize: 13, weight: .semibold, textColor: .black)
    let measure6 = CTLabel(textAlignment: .center, fontSize: 13, weight: .semibold, textColor: .black)
    let measure7 = CTLabel(textAlignment: .center, fontSize: 13, weight: .semibold, textColor: .black)
    
    var imageUrl = ""
    var bodyText = ""
    var instructionsText = ""
    // ingredient text
    var ingredientText1 = ""
    var ingredientText2 = ""
    var ingredientText3 = ""
    var ingredientText4 = ""
    var ingredientText5 = ""
    var ingredientText6 = ""
    var ingredientText7 = ""
    
    // measure text
    var measureText1 = ""
    var measureText2 = ""
    var measureText3 = ""
    var measureText4 = ""
    var measureText5 = ""
    var measureText6 = ""
    var measureText7 = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButtonImage()
        configureViewControlelr()
        configureUI()
        configureImage()
        
    }

    
    private func configureViewControlelr() {
        title = titleLabel.text!
        view.backgroundColor = .systemRed
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        
    }
    private func configureButtonImage() {
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapButtonImage))
        buttonImage.addGestureRecognizer(gestureRecognizer)
        buttonImage.isUserInteractionEnabled = true
        buttonImage.image = UIImage(systemName: "list.dash")
        buttonImage.layer.borderWidth = 0
        buttonImage.tintColor = .black
        buttonImage.layer.cornerRadius = 0
    }
    
     @objc func tapButtonImage() {
         let alertController = UIAlertController(title: "Instructions", message: instructionsText, preferredStyle: .alert)
         let okButton = UIAlertAction(title: "OK", style: .default)
         alertController.addAction(okButton)
         self.present(alertController,animated: true)
    }
    @objc func dismissVC() {
        dismiss(animated: true)
    }
    func configureImage() {
        imageView.downloadImage(urlString: imageUrl)
    }
    
    func configureUI() {
        view.addSubview(imageView)
        view.addSubview(titleLabel)
        view.addSubview(buttonImage)
        view.addSubview(ingredientLabel)
        view.addSubview(measureLabel)
        view.addSubview(ingredient1)
        view.addSubview(ingredient2)
        view.addSubview(ingredient3)
        view.addSubview(ingredient4)
        view.addSubview(ingredient5)
        view.addSubview(ingredient6)
        view.addSubview(ingredient7)
        view.addSubview(measure1)
        view.addSubview(measure2)
        view.addSubview(measure3)
        view.addSubview(measure4)
        view.addSubview(measure5)
        view.addSubview(measure6)
        view.addSubview(measure7)
       
       
        ingredientLabel.text = "Ingredient"
        measureLabel.text = "Measure"
        
        ingredient1.text = ingredientText1
        ingredient2.text = ingredientText2
        ingredient3.text = ingredientText3
        ingredient4.text = ingredientText4
        ingredient5.text = ingredientText5
        ingredient6.text = ingredientText6
        ingredient7.text = ingredientText7
        
        measure1.text = measureText1
        measure2.text = measureText2
        measure3.text = measureText3
        measure4.text = measureText4
        measure5.text = measureText5
        measure6.text = measureText6
        measure7.text = measureText7
        
  
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: padding),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: padding*5),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -padding*5),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor,constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor,constant: padding*4),
            titleLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor,constant: -padding*4),
            titleLabel.heightAnchor.constraint(equalToConstant: 21),
            
            buttonImage.trailingAnchor.constraint(equalTo: titleLabel.leadingAnchor,constant: -padding),
            buttonImage.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            
            ingredientLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: padding),
            ingredientLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            ingredientLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),
            ingredientLabel.heightAnchor.constraint(equalToConstant: 16),
            
           
            
            measureLabel.centerYAnchor.constraint(equalTo: ingredientLabel.centerYAnchor),
            measureLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            measureLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),
            measureLabel.heightAnchor.constraint(equalToConstant: 16),
            
            
            //ingredient
            ingredient1.topAnchor.constraint(equalTo: ingredientLabel.bottomAnchor,constant: padding),
            ingredient1.leadingAnchor.constraint(equalTo: ingredientLabel.leadingAnchor),
            ingredient1.trailingAnchor.constraint(equalTo: ingredientLabel.trailingAnchor),
            ingredient1.heightAnchor.constraint(equalToConstant: 14),
            
            ingredient2.topAnchor.constraint(equalTo: ingredient1.bottomAnchor,constant: padding),
            ingredient2.leadingAnchor.constraint(equalTo: ingredient1.leadingAnchor),
            ingredient2.trailingAnchor.constraint(equalTo: ingredient1.trailingAnchor),
            ingredient2.heightAnchor.constraint(equalToConstant: 14),
            
            ingredient3.topAnchor.constraint(equalTo: ingredient2.bottomAnchor,constant: padding),
            ingredient3.leadingAnchor.constraint(equalTo: ingredient2.leadingAnchor),
            ingredient3.trailingAnchor.constraint(equalTo: ingredient2.trailingAnchor),
            ingredient3.heightAnchor.constraint(equalToConstant: 14),
            
            ingredient4.topAnchor.constraint(equalTo: ingredient3.bottomAnchor,constant: padding),
            ingredient4.leadingAnchor.constraint(equalTo: ingredient3.leadingAnchor),
            ingredient4.trailingAnchor.constraint(equalTo: ingredient3.trailingAnchor),
            ingredient4.heightAnchor.constraint(equalToConstant: 14),
            
            ingredient5.topAnchor.constraint(equalTo: ingredient4.bottomAnchor,constant: padding),
            ingredient5.leadingAnchor.constraint(equalTo: ingredient4.leadingAnchor),
            ingredient5.trailingAnchor.constraint(equalTo: ingredient4.trailingAnchor),
            ingredient5.heightAnchor.constraint(equalToConstant: 14),
            
            ingredient6.topAnchor.constraint(equalTo: ingredient5.bottomAnchor,constant: padding),
            ingredient6.leadingAnchor.constraint(equalTo: ingredient5.leadingAnchor),
            ingredient6.trailingAnchor.constraint(equalTo: ingredient5.trailingAnchor),
            ingredient6.heightAnchor.constraint(equalToConstant: 14),
            
            ingredient7.topAnchor.constraint(equalTo: ingredient6.bottomAnchor,constant: padding),
            ingredient7.leadingAnchor.constraint(equalTo: ingredient6.leadingAnchor),
            ingredient7.trailingAnchor.constraint(equalTo: ingredient6.trailingAnchor),
            ingredient7.heightAnchor.constraint(equalToConstant: 14),
            ingredient7.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -padding),
            
            //measure
            
            measure1.topAnchor.constraint(equalTo: measureLabel.bottomAnchor,constant: padding),
            measure1.leadingAnchor.constraint(equalTo: measureLabel.leadingAnchor),
            measure1.trailingAnchor.constraint(equalTo: measureLabel.trailingAnchor),
            measure1.heightAnchor.constraint(equalToConstant: 14),
            
            measure2.topAnchor.constraint(equalTo: measure1.bottomAnchor,constant: padding),
            measure2.leadingAnchor.constraint(equalTo: measure1.leadingAnchor),
            measure2.trailingAnchor.constraint(equalTo: measure1.trailingAnchor),
            measure2.heightAnchor.constraint(equalToConstant: 14),
            
            measure3.topAnchor.constraint(equalTo: measure2.bottomAnchor,constant: padding),
            measure3.leadingAnchor.constraint(equalTo: measure2.leadingAnchor),
            measure3.trailingAnchor.constraint(equalTo: measure2.trailingAnchor),
            measure3.heightAnchor.constraint(equalToConstant: 14),
            
            measure4.topAnchor.constraint(equalTo: measure3.bottomAnchor,constant: padding),
            measure4.leadingAnchor.constraint(equalTo: measure3.leadingAnchor),
            measure4.trailingAnchor.constraint(equalTo: measure3.trailingAnchor),
            measure4.heightAnchor.constraint(equalToConstant: 14),
            
            measure5.topAnchor.constraint(equalTo: measure4.bottomAnchor,constant: padding),
            measure5.leadingAnchor.constraint(equalTo: measure4.leadingAnchor),
            measure5.trailingAnchor.constraint(equalTo: measure4.trailingAnchor),
            measure5.heightAnchor.constraint(equalToConstant: 14),
            
            measure5.topAnchor.constraint(equalTo: measure5.bottomAnchor,constant: padding),
            measure5.leadingAnchor.constraint(equalTo: measure5.leadingAnchor),
            measure5.trailingAnchor.constraint(equalTo: measure5.trailingAnchor),
            measure5.heightAnchor.constraint(equalToConstant: 14),
            
            measure6.topAnchor.constraint(equalTo: measure5.bottomAnchor,constant: padding),
            measure6.leadingAnchor.constraint(equalTo: measure5.leadingAnchor),
            measure6.trailingAnchor.constraint(equalTo: measure5.trailingAnchor),
            measure6.heightAnchor.constraint(equalToConstant: 14),
            
            measure7.topAnchor.constraint(equalTo: measure6.bottomAnchor,constant: padding),
            measure7.leadingAnchor.constraint(equalTo: measure6.leadingAnchor),
            measure7.trailingAnchor.constraint(equalTo: measure6.trailingAnchor),
            measure7.heightAnchor.constraint(equalToConstant: 14),
            
        ])
    }
}
