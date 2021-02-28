//
//  ArticleTableViewCell.swift
//  VisitPlace
//
//  Created by Oleksiy Chebotarov on 26/02/2021.
//

import SDWebImage
import UIKit

protocol ArticleViewModelCellType {
    var article: Article { get }
}

class ArticleTableViewCell: UITableViewCell {
    static var reuseIdentifier: String = "CellID"

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var articleImageView: UIImageView!
    @IBOutlet var authorImageView: UIImageView!
    @IBOutlet var likeslabel: UILabel!
    @IBOutlet var categorylabel: UILabel!
    @IBOutlet var authorName: UILabel!

    var viewModel: ArticleViewModelCellType? {
        didSet {
            updateUI()
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        articleImageView.image = nil
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        configUI()
    }

    private func configUI() {
        articleImageView.layer.cornerRadius = 10
        articleImageView.layer.masksToBounds = true
        articleImageView.layer.borderWidth = 0.5
        articleImageView.layer.borderColor = UIColor.lightGray.cgColor
        authorImageView.layer.cornerRadius = authorImageView.bounds.height / 2
        authorImageView.layer.masksToBounds = true
        authorImageView.layer.borderWidth = 0.5
        authorImageView.layer.borderColor = UIColor.lightGray.cgColor
    }

    private func updateUI() {
        guard let viewModel = viewModel else { return }
        let article = viewModel.article
        titleLabel.text = article.title
        likeslabel.text = String(article.likesCount)
        categorylabel.text = article.category
        authorName.text = article.author.authorName
        if let articleURL = article.articleImageUrl {
            articleImageView.sd_setImage(with: articleURL, placeholderImage: UIImage(named: "placeholder"))
        }

        if let avatarURL = article.author.avatarURL {
            authorImageView.sd_setImage(with: avatarURL, placeholderImage: UIImage(named: "placeholder"))
        }
    }
}
