//
//  FilmDetailsViewController.swift
//  Homework18
//
//  Created by valeri mekhashishvili on 2/7/23.
//

import UIKit

class FilmDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filmsArray.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let filmArr = filmsArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: FilmDetailTableViewCell.identifier, for: indexPath) as! FilmDetailTableViewCell
        cell.setup(with: filmArr)
        return cell
    }
    
    @IBOutlet private  weak var tableView: UITableView!
    
    
    var filmsArray: [FilmDetailCellModel] =  [
        .init(imageName: "1", filmTitle: "Pinocchio", filmDetail: "A father's wish magically brings a wooden boy to life in Italy, giving him a chance to care for the child."),
        .init(imageName: "2", filmTitle: "Top Gun", filmDetail: "After thirty years, Maverick is still pushing the envelope as a top naval aviator, but must confront ghosts of his past when he leads TOP GUN's."),
        .init(imageName: "3", filmTitle: "Boiling Point", filmDetail: "Enter the relentless pressure of a restaurant kitchen as a head chef wrangles his team on the busiest day of the year."),
        .init(imageName: "4", filmTitle: "The Batman", filmDetail: "When a sadistic serial killer begins murdering key political figures in Gotham, Batman is forced to investigate the city's hidden."),
        .init(imageName: "5", filmTitle: "Elvis", filmDetail: "The life of American music icon Elvis Presley, from his childhood to becoming a rock and movie star in the 1950s while maintaining a complex relationship with his manager"),
        .init(imageName: "6", filmTitle: "Aftersun", filmDetail: "Sophie reflects on the shared joy and private melancholy of a holiday she took with her father twenty years earlier."),
        .init(imageName: "7", filmTitle: "Tár", filmDetail: "Set in the international world of Western classical music, the film centers on Lydia Tár, widely considered one of the greatest living."),
        .init(imageName: "8", filmTitle: "The Fabelmans", filmDetail: "Growing up in post-World War II era Arizona, young Sammy Fabelman aspires to become a filmmaker as he reaches adolescence."),
        .init(imageName: "1.5", filmTitle: "The Banshees of Inisherin", filmDetail: "Two lifelong friends find themselves at an impasse when one abruptly ends their relationship, with alarming consequences for both of them."),
        .init(imageName: "10", filmTitle: "Glass Onion:", filmDetail: "Famed Southern detective Benoit Blanc travels to Greece for his latest case."),
        .init(imageName: "11", filmTitle: "Nope", filmDetail: "The residents of a lonely gulch in inland California bear witness to an uncanny and chilling discovery."),
        .init(imageName: "12", filmTitle: "Decision to Leave", filmDetail: "A detective investigating a man's death in the mountains meets the dead man's mysterious wife in the course of his dogged sleuthing."),
        .init(imageName: "13", filmTitle: "Happening", filmDetail: "An adaptation of Annie Ernaux's novel of the same name, looking back on her experience with abortion when it was still illegal in France in the 1960s."),
        .init(imageName: "14", filmTitle: "The Northman", filmDetail: "A young Viking prince is on a quest to avenge his father's murder.")
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        self.navigationItem.titleView = setTitle(title: "Page Title", subtitle: "SubTitle")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "FilmDetailTableViewCell", bundle: .main), forCellReuseIdentifier: "FilmDetailTableViewCell")
        
        let ratingView = StarRatingStackView(frame: CGRect(x: 0, y: 0, width: 150, height: 50))
        view.addSubview(ratingView)
    }
    
    func setTitle(title: String, subtitle: String) -> UIView {
        let titleLabel = UILabel(frame: CGRect(x: -135, y: -10, width: 7, height: 7))
        titleLabel.backgroundColor = UIColor.clear
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont.boldSystemFont(ofSize: 15)
        titleLabel.text = title
        titleLabel.sizeToFit()
        
        let subtitleLabel = UILabel(frame: CGRect(x: 135, y: 4, width: 7, height: 7))
        subtitleLabel.backgroundColor = UIColor.clear
        subtitleLabel.textColor = UIColor.gray
        subtitleLabel.font = UIFont.systemFont(ofSize: 12)
        subtitleLabel.textAlignment = .center
        subtitleLabel.text = subtitle
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

