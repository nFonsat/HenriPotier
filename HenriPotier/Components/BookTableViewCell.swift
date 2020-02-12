//
//  BookTableViewCell.swift
//  HenriPotier
//
//  Created by Nicolas Fonsat on 12/02/2020.
//  Copyright © 2020 BlackStyle. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    
    @IBOutlet var titleBook: UILabel!
    
    @IBOutlet var imageBook: UIImageView!
    
    @IBOutlet var titlePrice: UILabel!
    
    public var book: BookModel!
    {
        didSet {
            self.titleBook.text = self.book.title
            self.titlePrice.text = "\(self.book.price)€"
            self.imageBook.load(urlString: self.book.cover)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension UIImageView {
    func load(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
