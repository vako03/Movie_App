//
//  FilmCell.swift
//  Homework18
//
//  Created by valeri mekhashishvili on 2/6/23.
//

import UIKit

class FilmCell: UICollectionViewCell {
    
    @IBOutlet weak var filmImageView: UIImageView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        filmImageView.layer.cornerRadius = filmImageView.bounds.height / 2
        filmImageView.layer.masksToBounds = true
    }
    
    @IBOutlet weak var filmtitle: UILabel!
    
    static let identifier = "FilmCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    func setup(with model: FilmCellModel) {
        filmImageView.image = UIImage(named: model.imageName)
        filmtitle.text = model.filmTitle
        filmtitle.numberOfLines = 0

    }
  
}
