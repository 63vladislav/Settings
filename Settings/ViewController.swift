//
//  ViewController.swift
//  Settings
//
//  Created by 111 on 24.03.2024.
//


import UIKit

struct Section {
    let title: String
    let option: [SettingOptionType]
}

enum SettingOptionType {
    case staticCell(model: SettingOption)
    case switchCell(model: SettingSwitchOption)
}

struct SettingSwitchOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColour: UIColor
    let handler: (()-> Void)
    var isOn: Bool
}

struct SettingOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColour: UIColor
    let handler: (()-> Void)
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(SettingTableViewCell.self,
                       forCellReuseIdentifier: SettingTableViewCell.indentifier)
        table.register(SwitchTableViewCell.self,
                       forCellReuseIdentifier: SwitchTableViewCell.indentifier)
        
        return table
    }()
    
    var models = [Section]()
    
    // mark: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        title = "Настройки"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
    }
    
    func configure() {
        
        // Основные
        models.append(Section(title: "", option: [
            .switchCell(model:SettingSwitchOption(
                title: "Авиарежим",
                icon: UIImage(systemName: "airplane"),
                iconBackgroundColour: .systemOrange,
                handler: {},
                isOn: false)
                ),
            
            .staticCell(model: SettingOption(
                title: "Wi-Fi",
                icon: UIImage(systemName: "wifi"),
                iconBackgroundColour: .systemBlue) {
                } ),
            
            .staticCell(model: SettingOption(
                title: "Bluetooth",
                icon: UIImage(named: "icons8-блютуз-50"),
                iconBackgroundColour: .systemBlue) {
                } ),
            .staticCell(model: SettingOption(
                title: "Сотовая связь",
                icon: UIImage(systemName: "antenna.radiowaves.left.and.right"),
                iconBackgroundColour: .systemGreen) {
                } ),
            .staticCell(model: SettingOption(
                title: "Режим модема",
                icon: UIImage(systemName: "personalhotspot"),
                iconBackgroundColour: .systemGreen) {
                } ),
            .switchCell(model:SettingSwitchOption(
                title: "VPN",
                icon: UIImage(systemName: "globe.europe.africa"),
                iconBackgroundColour: .systemCyan,
                handler: {},
                isOn: false)
                )
            
                         ]))
        
        //Вторая часть
        
        models.append(Section(title: "", option: [
            .staticCell(model: SettingOption(
                title: "Уведомления",
                icon: UIImage(systemName: "bell.badge.fill"),
                iconBackgroundColour: .systemOrange) {
                } ),
            
            .staticCell(model: SettingOption(
                title: "Звуки, тактильные сигналы",
                icon: UIImage(systemName: "megaphone.fill"),
                iconBackgroundColour: .systemRed) {
                } ),
            
            .staticCell(model: SettingOption(
                title: "Фокусирование",
                icon: UIImage(systemName: "moon.fill"),
                iconBackgroundColour: .systemPurple) {
                } ),
            .staticCell(model: SettingOption(
                title: "Экранное время",
                icon: UIImage(systemName: "clock.arrow.2.circlepath"),
                iconBackgroundColour: .systemPurple) {
                })
                         ]))
        
        //Третья Часть
        
        models.append(Section(title: "", option: [
            .staticCell(model: SettingOption(
                title: "Основные",
                icon: UIImage(systemName: "gear"),
                iconBackgroundColour: .systemGray) {
                } ),
            
            .staticCell(model: SettingOption(
                title: "Пункт управление",
                icon: UIImage(systemName: "switch.2"),
                iconBackgroundColour: .systemGray) {
                } ),
            
            .staticCell(model: SettingOption(
                title: "Экран и яркость",
                icon: UIImage(systemName: "sun.max"),
                iconBackgroundColour: .systemBlue) {
                } ),
            .staticCell(model: SettingOption(
                title: "Экран 'Домой' и библиотека приложений",
                icon: UIImage(systemName: "aqi.medium"),
                iconBackgroundColour: .systemPurple) {
                } ),
            .staticCell(model: SettingOption(
                title: "Универсальный доступ",
                icon: UIImage(named: "accessibility"),
                iconBackgroundColour: .systemBlue) {
                } ),
            .staticCell(model: SettingOption(
                title: "Обои",
                icon: UIImage(systemName: "snowflake"),
                iconBackgroundColour: .systemCyan) {
                } ),
            .staticCell(model: SettingOption(
                title: "Ожидание",
                icon: UIImage(systemName: "clock.badge.fill"),
                iconBackgroundColour: .black) {
                } ),
            .staticCell(model: SettingOption(
                title: "Siri и Поиск",
                icon: UIImage(systemName: "s.square.fill"),
                iconBackgroundColour: .systemOrange) {
                } ),
            .staticCell(model: SettingOption(
                title: "Face ID и код-пароль",
                icon: UIImage(systemName: "faceid"),
                iconBackgroundColour: .systemGreen) {
                } ),
            .staticCell(model: SettingOption(
                title: "Экстренный вызов - SOS",
                icon: UIImage(systemName: "sos"),
                iconBackgroundColour: .systemRed) {
                } ),
            .staticCell(model: SettingOption(
                title: "Уведомления о контакте",
                icon: UIImage(systemName: "sun.min.fill"),
                iconBackgroundColour: .red) {
                } ),
            .staticCell(model: SettingOption(
                title: "Аккумулятор",
                icon: UIImage(named: "custom.battery.100percent"),
                iconBackgroundColour: .systemGreen) {
                } ),
            .staticCell(model: SettingOption(
                title: "Конфиденциальность и бозопасность",
                icon: UIImage(systemName: "hand.raised.fill"),
                iconBackgroundColour: .systemBlue) {
                })
            
                         ]))
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].option.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].option[indexPath.row]
        
        switch model.self {
        case .staticCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SettingTableViewCell.indentifier,
                for: indexPath
            ) as? SettingTableViewCell
                    
            else {
                
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell

        case .switchCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SwitchTableViewCell.indentifier,
                for: indexPath
            ) as? SwitchTableViewCell
            else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        }
        
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let type = models[indexPath.section].option[indexPath.row]
        switch type.self {
        case .staticCell(let model):
            model.handler()
        case .switchCell(let model):
            model.handler()
        }
    }
}


