//
//  FilmDetailTableViewCell.swift
//  Homework18
//
//  Created by valeri mekhashishvili on 2/7/23.
//

import UIKit

class FilmDetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var filmImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    static let identifier = "FilmDetailTableViewCell"

    @IBOutlet weak var filmRaiting: UIImageView!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var shareButton: UIButton!
    
    class StarRatingView: UIView {
        private var rating: Double = 0.0

        func setRating(_ rating: Double) {
            self.rating = rating
            setNeedsDisplay()
        }

        override func draw(_ rect: CGRect) {
            let starPath = UIBezierPath()
            let starSize = min(bounds.width, bounds.height)
            let starSpacing = starSize * 0.1
            let numberOfStars = 5

            for i in 0..<numberOfStars {
                let x = (starSize + starSpacing) * CGFloat(i)
                let y = bounds.midY - starSize / 2
                let starRect = CGRect(x: x, y: y, width: starSize, height: starSize)
                let isFilled = Double(i + 1) <= rating
                drawStar(in: starRect, isFilled: isFilled)
            }
        }
        
        private func drawStar(in rect: CGRect, isFilled: Bool) {
            let starPath = UIBezierPath()
            starPath.move(to: CGPoint(x: rect.midX, y: rect.minY))
            starPath.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
            starPath.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            starPath.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
            starPath.close()
            starPath.fill()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.filmImageView.layer.cornerRadius = 5
        self.shareButton.layer.cornerRadius = 18
        
    }
    
    func setup(with model:FilmDetailCellModel) {
        
        filmImageView.image = UIImage(named: model.imageName)
        titleLabel.text = model.filmTitle
        descriptionLabel.text = model.filmDetail
    }
}


    

