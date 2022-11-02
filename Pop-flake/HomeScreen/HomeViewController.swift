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
    var timer = Timer()
    // MARK: - IBOutlets
    @IBOutlet weak var headerCollectionView: UICollectionView!
    @IBOutlet weak var myPageControl: UIPageControl!
    @IBOutlet weak var homeTableView: UITableView!
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        initViewModel()
    }
    // MARK: - Main Methods
    func initView() {
        tableViewConfig()
        collectionViewConfig()
        appAppearanceConfig()
        monitorNetwork()
    }
    func initViewModel() {
        fetchTrailers()
    }
    // MARK: - UI Methods
    func tableViewConfig() {
        homeTableView.delegate = self
        homeTableView.dataSource = self
        homeTableView.register(UINib(nibName: K.commingSoonTableViewCell, bundle: .main),
                               forCellReuseIdentifier: K.commingSoonTableViewCell)
        homeTableView.register(UINib(nibName: K.grossingTableViewCell, bundle: .main),
                               forCellReuseIdentifier: K.grossingTableViewCell)
        homeTableView.register(UINib(nibName: K.inTheatersTableViewCellID, bundle: .main),
                               forCellReuseIdentifier: K.inTheatersTableViewCellID)
        homeTableView.register(UINib(nibName: K.top250TableViewCellID, bundle: .main),
                               forCellReuseIdentifier: K.top250TableViewCellID)
    }
    func collectionViewConfig() {
        myPageControl.numberOfPages = homeViewModel.trailersArray.count
        myPageControl.currentPage = 0
        headerCollectionView.delegate = self
        headerCollectionView.dataSource = self
        headerCollectionView.register(UINib(nibName: K.headerCollectionViewCellID,
                                            bundle: .main), forCellWithReuseIdentifier: K.headerCollectionViewCellID)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self
                                              , selector: #selector(self.changeImage), userInfo: nil, repeats: true)
        }
    }
    func appAppearanceConfig() {
        let window = UIApplication.shared.windows[0]
        if UserDefaults.standard.bool(forKey: "isDarkMode") == true {
            window.overrideUserInterfaceStyle = .dark
        } else {
            window.overrideUserInterfaceStyle = .light
        }
    }
    @objc func changeImage() {
        if homeViewModel.counter < homeViewModel.trailersArray.count {
            let index = IndexPath.init(item: homeViewModel.counter, section: 0)
            self.headerCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            myPageControl.currentPage = homeViewModel.counter
            homeViewModel.counter += 1
        } else {
            homeViewModel.counter = 0
            let index = IndexPath.init(item: homeViewModel.counter, section: 0)
            self.headerCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
            myPageControl.currentPage = homeViewModel.counter
            homeViewModel.counter = 1
        }
    }
    // MARK: - Data Methods
    func fetchTrailers() {
        Task.init {
            if let movie = await homeViewModel.fetchTrailers(id: "tt0111161" ) {
                self.homeViewModel.trailerOne = movie
                if let secondMovie = await homeViewModel.fetchTrailers(id: "tt0068646" ) {
                    self.homeViewModel.trailerTwo = secondMovie
                }
                if let thirdMovie = await homeViewModel.fetchTrailers(id: "tt0468569"  ) {
                    self.homeViewModel.trailerThree = thirdMovie
                }
                DispatchQueue.main.async { [self] in
                    self.homeViewModel.trailersArray = [ homeViewModel.trailerOne!,
                                                         homeViewModel.trailerTwo!,
                                                         homeViewModel.trailerThree!]
                    headerCollectionView.reloadData()
                }
            } else {
                DispatchQueue.main.async {
                    self.presentAlert(title: "Error While Fetching Trailers",
                                      message: "")
                }
            }
        }
    }
}
