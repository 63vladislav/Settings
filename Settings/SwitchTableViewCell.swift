//
//  SwitchTableViewCell.swift
//  Settings
//
//  Created by 111 on 25.03.2024.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {
    
    static let indentifier = "SwitchTableViewCell"
    
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
    
    private let theSwitch: UISwitch = {
        
        let theSwitch = UISwitch()
        theSwitch.onTintColor = .systemBlue
        return theSwitch
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(iconConteiner)
        contentView.addSubview(theSwitch)
        iconConteiner.addSubview(iconImageView)
        contentView.clipsToBounds = true
        accessoryType = .none

    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        let size: CGFloat = contentView.frame.size.height - 12
        iconConteiner.frame = CGRect(
            x: 15,
            y: 6,
            width: size,
            height: size)
        
        let imageSize: CGFloat = size/1.5
        iconImageView.frame = CGRect(
            x: (size - imageSize) / 2,
            y: (size - imageSize) / 2,
            width: imageSize,
            height: imageSize)
        
        theSwitch.sizeToFit()
        theSwitch.frame = CGRect(
            x: (contentView.frame.size.width - theSwitch.frame.size.width) - 20,
            y: (contentView.frame.size.height - theSwitch.frame.size.height) / 2,
            width: theSwitch.frame.size.width,
            height: theSwitch.frame.size.height)
        
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
        theSwitch.isOn = false
    }
    
    public func configure( with model: SettingSwitchOption) {
        
        label.text = model.title
        iconImageView.image = model.icon
        iconConteiner.backgroundColor = model.iconBackgroundColour
        theSwitch.isOn = model.isOn
    }
}
