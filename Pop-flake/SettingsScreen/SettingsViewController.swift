//
//  SettingsViewController.swift
//  Pop-flake
//
//  Created by Mostafa Elbadawy on 30/10/2022.
//
import UIKit
class SettingsViewController: MainViewController {
    @IBOutlet weak var settingsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewConfig()
    }
    func tableViewConfig() {
        settingsTableView.delegate = self
        settingsTableView.dataSource = self
        settingsTableView.register(UINib(nibName: K.settingsTableViewCell, bundle: .main),
                                   forCellReuseIdentifier: K.settingsTableViewCell)
    }
}
