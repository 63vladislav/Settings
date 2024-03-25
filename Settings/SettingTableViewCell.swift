//
//  SettingTableViewCell.swift
//  Settings
//
//  Created by 111 on 24.03.2024.
//

import UIKit

class SettingTableViewCell: UITableViewCell {
    
    static let indentifier = "SettingTableViewCell"
    
    private let iconConteiner: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(iconConteiner)
        iconConteiner.addSubview(iconImageView)
        
        contentView.clipsToBounds = true
        accessoryType = .disclosureIndicator

    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let size: CGFloat = contentView.frame.size.height - 12
        iconConteiner.frame = CGRect(x: 15, y: 6, width: size, height: size)
        
        let imageSize: CGFloat = size/1.5
        iconImageView.frame = CGRect(
            x: (size - imageSize) / 2,
            y: (size - imageSize) / 2,
            width: imageSize,
            height: imageSize)
        
       // iconImageView.center = iconConteiner.center
        
        label.frame = CGRect(
            x: 25 + iconConteiner.frame.size.width,
            y: 0,
            width: contentView.frame.size.width - iconConteiner.frame.size.width - 20,
            height: contentView.frame.size.height
        )
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        label.text = nil
        iconConteiner.backgroundColor = nil
    }
    
    public func configure( with model: SettingOption) {
        label.text = model.title
        iconImageView.image = model.icon
        iconConteiner.backgroundColor = model.iconBackgroundColour
    }
}
