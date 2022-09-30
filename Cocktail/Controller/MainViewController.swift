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
        configureViewController()
        configureCollectionView()
        configureDataSource()
        getCocktail()
    }
    
    func configureViewController() {
        title = "Margarita"
    }

    func getCocktail() {
        NetworkManager.shared.getCoctail(for: title!) { [weak self] result in
            guard let self = self else { return }
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
        collectionView.delegate = self
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
extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let destVC = DetailViewController()
        let navController = UINavigationController(rootViewController: destVC)
        destVC.titleLabel.text = cocktails[indexPath.row].strDrink
        destVC.imageUrl = cocktails[indexPath.row].strDrinkThumb
        destVC.instructionsText = cocktails[indexPath.row].strInstructions
        destVC.ingredientText1 = cocktails[indexPath.row].strIngredient1 ?? ""
        destVC.ingredientText2 = cocktails[indexPath.row].strIngredient2 ?? ""
        destVC.ingredientText3 = cocktails[indexPath.row].strIngredient3 ?? ""
        destVC.ingredientText4 = cocktails[indexPath.row].strIngredient4 ?? ""
        destVC.ingredientText5 = cocktails[indexPath.row].strIngredient5 ?? ""
        destVC.ingredientText6 = cocktails[indexPath.row].strIngredient6 ?? ""
        destVC.ingredientText7 = cocktails[indexPath.row].strIngredient7 ?? ""
        destVC.measureText1 = cocktails[indexPath.row].strMeasure1 ?? ""
        destVC.measureText2 = cocktails[indexPath.row].strMeasure2 ?? ""
        destVC.measureText3 = cocktails[indexPath.row].strMeasure3 ?? ""
        destVC.measureText4 = cocktails[indexPath.row].strMeasure4 ?? ""
        destVC.measureText5 = cocktails[indexPath.row].strMeasure5 ?? ""
        destVC.measureText6 = cocktails[indexPath.row].strMeasure6 ?? ""
        destVC.measureText7 = cocktails[indexPath.row].strMeasure7 ?? ""
        present(navController,animated: true)
        
    }
}
