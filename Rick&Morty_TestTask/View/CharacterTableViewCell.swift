//
//  CharacterTableViewCell.swift
//  Rick&Morty_TestTask
//
//  Created by Поляндий on 11.11.2022.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = true
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 21, weight: .semibold)
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 17, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        return label
    }()
    
    private lazy var speciesLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = true
        return label
    }()
    
    private lazy var genderLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = true
        return label
    }()
    
    private lazy var originLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = true
        return label
    }()
    
    private lazy var charImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 40
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .secondarySystemBackground
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = true
        return imageView
    }()
    
    private lazy var charStackView: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .leading
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.spacing = 4
        stack.translatesAutoresizingMaskIntoConstraints = true
        return stack
    }()
    
    private lazy var locationView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "map-point.png")
        return iv
    }()
    
    private lazy var watchButton: UIButton = {
        let button = UIButton()
        button.setTitle(" ▶ Watch episodes ", for: .normal)
        button.titleLabel?.font = UIFont(name: "watch", size: 17)
        button.setTitleColor(#colorLiteral(red: 1, green: 0.4196078431, blue: 0, alpha: 1), for: .normal)
        button.backgroundColor = UIColor(#colorLiteral(red: 1, green: 0.4196078431, blue: 0, alpha: 0.1))
        button.layer.cornerRadius = 17
        button.layer.masksToBounds = true
        return button
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier )
        contentView.addSubview(nameLabel)
        contentView.addSubview(statusLabel)
        contentView.addSubview(charStackView)
        contentView.addSubview(locationView)
        contentView.addSubview(originLabel)
        contentView.addSubview(charImageView)
        contentView.addSubview(watchButton)
        
        charStackView.addArrangedSubview(speciesLabel)
        charStackView.addArrangedSubview(genderLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        charImageView.frame = CGRect(
            x: 24,
            y: 24,
            width: 120,
            height: contentView.frame.size.height - 32
        )
        
        nameLabel.frame = CGRect(
            x: 162,
            y: 24,
            width: 137,
            height: 25
        )
        
        charStackView.frame = CGRect(
            x: 162,
            y: 53,
            width: 87,
            height: 17
        )
        
        watchButton.frame = CGRect(
            x: 162,
            y: 70,
            width: 148,
            height: 35
        )
        
        locationView.frame = CGRect(
            x: 162,
            y: 117,
            width: 8.4,
            height: 12
        )
        
        originLabel.frame = CGRect(
            x: 178.2,
            y: 115,
            width: 102,
            height: 17
        )
        
        setupStatus()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        statusLabel.text = nil
        speciesLabel.text = nil
        genderLabel.text = nil
        originLabel.text = nil
        charImageView.image = nil
    }
    
    func setupStatus() {
        statusLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24).isActive = true
        statusLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24).isActive = true
        statusLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        switch statusLabel.text {
        case "Alive":
            statusLabel.backgroundColor = UIColor(#colorLiteral(red: 0.7803921569, green: 1, blue: 0.7254901961, alpha: 1))
            statusLabel.textColor = UIColor(#colorLiteral(red: 0.1921568627, green: 0.6235294118, blue: 0.0862745098, alpha: 1))
            statusLabel.widthAnchor.constraint(equalToConstant: 55).isActive = true
        case "Dead":
            statusLabel.backgroundColor = UIColor(#colorLiteral(red: 1, green: 0.9098039216, blue: 0.8784313725, alpha: 1))
            statusLabel.textColor = UIColor(#colorLiteral(red: 0.9137254902, green: 0.2196078431, blue: 0, alpha: 1))
            statusLabel.widthAnchor.constraint(equalToConstant: 55).isActive = true
        default:
            statusLabel.backgroundColor = UIColor(#colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1))
            statusLabel.textColor = UIColor(#colorLiteral(red: 0.6274509804, green: 0.6274509804, blue: 0.6274509804, alpha: 1))
            statusLabel.widthAnchor.constraint(equalToConstant: 92).isActive = true
        }
    }
    
    func configure(with characterModel: CharacterTableViewCellModel){
        nameLabel.text = characterModel.name
        statusLabel.text = characterModel.status
        speciesLabel.text = characterModel.species + ","
        genderLabel.text = characterModel.gender
        originLabel.text = characterModel.origin
        
        if let data = characterModel.imageData {
            charImageView.image = UIImage(data: data)
        }
        else if let url = characterModel.imageURL {
            URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                characterModel.imageData = data
                DispatchQueue.main.async {
                    self?.charImageView.image = UIImage(data: data)
                }
            }.resume()
        }
    }
}
