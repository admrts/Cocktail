//
//  DetailViewController.swift
//  Cocktail
//
//  Created by Ali Demirtaş on 29.09.2022.
//

import UIKit

class DetailViewController: UIViewController {

    var imageView = CTImageView(frame: .zero)
    var titleLabel = CTLabel(textAlignment: .center, fontSize: 20, weight: .bold,textColor: .black)
    
    var imageUrl = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControlelr()
        configureUI()
        configureImage()
    
    }

    
    private func configureViewControlelr() {
        title = "Detail \(titleLabel.text!)"
        view.backgroundColor = .systemRed
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
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
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: padding),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: padding),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -padding),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor,constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
}
