//
//  NewsTableViewCell.swift
//  NewsApp
//
//  Created by Mouli Agastya on 9/14/26.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    static let identifier = "NewsTableViewCell"
    
    private let containerView: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 250).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let shareImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let newsImage: UIImageView = {
        let image = UIImageView()
        image.widthAnchor.constraint(equalToConstant: 20).isActive = true
        image.widthAnchor.constraint(equalToConstant: 20).isActive = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpCellUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("NS coder init? not defined")
    }
    
    func setUpCellUI() {
        contentView.addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(descriptionLabel)
        containerView.addSubview(shareImage)
        containerView.addSubview(dateLabel)
        contentView.addSubview(newsImage)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -120),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            
            shareImage.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            shareImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            // shareImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            shareImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            dateLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            dateLabel.leadingAnchor.constraint(equalTo: shareImage.trailingAnchor, constant: 16),
            dateLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),

            newsImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25),
            newsImage.leadingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 8),
            newsImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            newsImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -25),
        ])
    }
    
    func loadCellData(item: Article?) {
        titleLabel.text = item?.title
        descriptionLabel.text = item?.description
        shareImage.image = UIImage(systemName: "square.and.arrow.up")
        dateLabel.text = item?.formattedDate
        newsImage.fetchImageFromUrl(urlString: item?.urlToImage ?? "")
    }
}
