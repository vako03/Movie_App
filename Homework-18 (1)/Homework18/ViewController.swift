//
//  ViewController.swift
//  Homework18
//
//  Created by valeri mekhashishvili on 2/6/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    @IBOutlet private weak var buttonTapped: UIButton!
    
    var films: [FilmCellModel] =  [
        .init(imageName: "1", filmTitle: "Pinocchio"),
        .init(imageName: "2", filmTitle: "Top Gun"),
        .init(imageName: "3", filmTitle: "Boiling Point"),
        .init(imageName: "4", filmTitle: "The Batman"),
        .init(imageName: "5", filmTitle: "Elvis"),
        .init(imageName: "6", filmTitle: "Aftersun"),
        .init(imageName: "7", filmTitle: "Tár"),
        .init(imageName: "8", filmTitle: " The Fabelmans"),
        .init(imageName: "9", filmTitle: "The Banshees of Inisherin"),
        .init(imageName: "10", filmTitle: "Glass Onion:"),
        .init(imageName: "11", filmTitle: "Nope"),
        .init(imageName: "12", filmTitle: "Decision to Leave"),
        .init(imageName: "13", filmTitle: "The Menu"),
        .init(imageName: "14", filmTitle: "Happening"),
        .init(imageName: "15", filmTitle: "The Northman")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonTapped.layer.cornerRadius = buttonTapped.bounds.height / 2
        buttonTapped.layer.masksToBounds = true
        self.navigationItem.titleView = setTitle(title: "Page Title", subtitle: "SubTitle")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "FilmCell", bundle: nil), forCellWithReuseIdentifier: FilmCell.identifier)
        self.buttonTapped.applyGradient(colours: [.systemPink, .purple])
    }
    
    @IBAction func button(_ sender: Any) {
        
        let filmDetailViewController = storyboard?.instantiateViewController(withIdentifier: "FilmDetailsViewController") as! FilmDetailsViewController
        navigationController?.pushViewController(filmDetailViewController, animated: true)
    }
    
    func setTitle(title: String, subtitle: String) -> UIView {
        let titleLabel = UILabel(frame: CGRect(x: -135, y: -10, width: 7, height: 7))
        titleLabel.backgroundColor = UIColor.clear
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
        titleLabel.text = title
        titleLabel.textAlignment = .left
        titleLabel.sizeToFit()

        let subtitleLabel = UILabel(frame: CGRect(x: 135, y: 4, width: 7, height: 7))
        subtitleLabel.backgroundColor = UIColor.clear
        subtitleLabel.textColor = UIColor.gray
        subtitleLabel.font = UIFont.systemFont(ofSize: 12)
        subtitleLabel.text = subtitle
        subtitleLabel.textAlignment = .left
        subtitleLabel.sizeToFit()

        let navigationView = UIView(frame: CGRectMake(0, 0, max(titleLabel.frame.size.width, subtitleLabel.frame.size.width), 0))
        navigationView.addSubview(titleLabel)
        navigationView.addSubview(subtitleLabel)

        let widthDiff = subtitleLabel.frame.size.width - titleLabel.frame.size.width

        if widthDiff < 0 {
            let newX = widthDiff / 2
            subtitleLabel.frame.origin.x = abs(newX)
        } else {
            let newX = widthDiff / 2
            titleLabel.frame.origin.x = newX
        }

        return navigationView
    }


}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        films.count

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let film = films[indexPath.row]

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilmCell.identifier, for: indexPath) as! FilmCell
        cell.setup(with: film)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let filmDetailViewController = storyboard?.instantiateViewController(withIdentifier: "FilmDetailsViewController") as! FilmDetailsViewController
        navigationController?.pushViewController(filmDetailViewController, animated: true)
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.height, height: collectionView.frame.width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        5
    }
    
}

extension UIView {

    func applyGradient(colours: [UIColor]) -> CAGradientLayer {
        return self.applyGradient(colours: colours, locations: nil)
    }

    func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> CAGradientLayer {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
        return gradient
    }
}




