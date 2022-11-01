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
    @IBOutlet weak var headerCollectionView: UICollectionView!
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
        // networkReachability(loadingIndicator: activityIndicator)
    }
    func initViewModel() {
       // fetchTrailers()
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
        headerCollectionView.delegate = self
        headerCollectionView.dataSource = self
        headerCollectionView.register(UINib(nibName: K.headerCollectionViewCellID,
                                              bundle: .main), forCellWithReuseIdentifier: K.headerCollectionViewCellID)
    }
    func appAppearanceConfig() {
        let window = UIApplication.shared.windows[0]
        if UserDefaults.standard.bool(forKey: "isDarkMode") == true {
            window.overrideUserInterfaceStyle = .dark
        } else {
            window.overrideUserInterfaceStyle = .light
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
                DispatchQueue.main.async {
                    self.homeViewModel.trailersArray = [ self.homeViewModel.trailerOne!, self.homeViewModel.trailerTwo!, self.homeViewModel.trailerThree! ]
                    print( self.homeViewModel.trailersArray)
                    self.headerCollectionView.reloadData()
                }
            } else {
                presentAlert(title: "Error While Fetching Trailers", message: (homeViewModel.trailerOne?.errorMessage)!)
            }
        }
    }
}
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = headerCollectionView.dequeueReusableCell(withReuseIdentifier:
                                                                K.headerCollectionViewCellID,
                                                              for: indexPath) as? HeaderCollectionViewCell
//        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) { [self] in
//            cell?.movieTitleLabel.text = homeViewModel.trailersArray[indexPath.item].fullTitle
//            if let url = homeViewModel.trailersArray[indexPath.item].thumbnailUrl {
//            cell!.movieImageView.kf.setImage(with: URL(string: url))
//             }
//            if let url = homeViewModel.top250Movies[indexPath.item].image {
//            cell!.trailerImageView.kf.setImage(with: URL(string: url))
//             }

   //     }
       // cell?.movieImageView.backgroundColor = .green
        return cell!
    }
}
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        return CGSize(width: view.frame.size.width, height: 300)
    }
}
