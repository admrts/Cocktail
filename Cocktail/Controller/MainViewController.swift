//
//  MainViewController.swift
//  Cocktail
//
//  Created by Ali Demirtaş on 28.09.2022.
//

import UIKit

class MainViewController: UIViewController {

    enum Section {
        case main
    }
    
    var collectionView: UICollectionView!
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Drinks>!
    
    var cocktails: [Drinks] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Margarita"
        configureCollectionView()
        configureDataSource()
        
        NetworkManager.shared.getCoctail(for: title!) { result in
            
            switch result {
            case .success(let cocktails):
                print(cocktails)
                self.cocktails = cocktails.drinks
                self.updateData()
            case .failure(let error):
                print(error.rawValue)
            }
        }
    }

    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds,collectionViewLayout: UIHelper.createThreeColumnLayout(in: view))
        collectionView.register(MainCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = .systemYellow
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
    }

    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Drinks>(collectionView: collectionView, cellProvider: { collectionView, indexPath, cocktail in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MainCell
            cell.set(cocktail: cocktail, indexPath: indexPath.row)
            return cell
        })
    }
    
    func updateData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Drinks>()
        snapshot.appendSections([.main])
        snapshot.appendItems(cocktails)
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot,animatingDifferences: true)
        }
        
    }
    
}

