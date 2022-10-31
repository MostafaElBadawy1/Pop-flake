//
//  HomeViewController.swift
//  Pop-flake
//
//  Created by Mostafa Elbadawy on 30/10/2022.
//
import UIKit
class HomeViewController: MainViewController {
    // MARK: - Props
    let homeViewModel = HomeViewModel()
    // MARK: - IBOutlets
    @IBOutlet weak var homeTableView: UITableView!
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        initViewModel()
    }
    // MARK: - UI Methods
    func initView() {
        tableViewConfig()
       // networkReachability(loadingIndicator: activityIndicator)
        appAppearanceConfig()
    }
    // MARK: - Data Methods
    func initViewModel() {
    }
    func tableViewConfig() {
        homeTableView.delegate = self
        homeTableView.dataSource = self
        homeTableView.register(UINib(nibName: K.commingSoonTableViewCell, bundle: .main),
                               forCellReuseIdentifier: K.commingSoonTableViewCell)
         homeTableView.register(UINib(nibName: K.grossingTableViewCell, bundle: .main),
                               forCellReuseIdentifier: K.grossingTableViewCell)
        homeTableView.register(HomeTableViewHeader.self, forHeaderFooterViewReuseIdentifier: K.homeTableViewHeaderID)
    }
    func appAppearanceConfig() {
        let window = UIApplication.shared.windows[0]
        if UserDefaults.standard.bool(forKey: "isDarkMode") == true {
            window.overrideUserInterfaceStyle = .dark
        } else {
            window.overrideUserInterfaceStyle = .light
        }
    }
}
