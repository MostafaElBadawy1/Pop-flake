//
//  SearchViewController.swift
//  Pop-flake
//
//  Created by Mostafa Elbadawy on 30/10/2022.
//
import UIKit
class SearchViewController: MainViewController {
    // MARK: - Props
    let noResultslabel = UILabel()
    let searchViewModel = SearchViewModel()
    var searchController = UISearchController()
    let myRefreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(SearchViewController.self, action: #selector(refresh(sender:)), for: .valueChanged)
        return refreshControl
    }()
    // MARK: - IBOutlets
    @IBOutlet weak var searchResultsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        initViewModel()
    }
    // MARK: - Main Methods
    func initView() {
        searchControllerSetup()
        tableViewConfig()
        // networkReachability(loadingIndicator: activityIndicator)
    }
    func initViewModel() {
        let searchWord = K.searchWord.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        // searchMovies(searchWord: searchWord!)
    }
    // MARK: - UI Methods
    func tableViewConfig() {
        searchResultsTableView.refreshControl = myRefreshControl
        searchResultsTableView.register(UINib(nibName: K.moviesTableViewCellID, bundle: .main),
                                        forCellReuseIdentifier: K.moviesTableViewCellID)
        searchResultsTableView.delegate = self
        searchResultsTableView.dataSource = self
        refresh(tableView: searchResultsTableView)
        self.activityIndicator.startAnimating()
    }
    func searchControllerSetup() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search For Movies Or Series."
        searchController.searchBar.delegate = self
    }
    func labelConfig() {
        noResultslabel.text = "No Results"
        noResultslabel.font = UIFont.boldSystemFont(ofSize: 20)
        noResultslabel.frame =  CGRect(x: 150, y: 130, width: 300, height: 50)
        self.view.addSubview(noResultslabel)
    }
    @objc private func refresh(sender: UIRefreshControl) {
        searchMovies(searchWord: "Suits")
        self.searchResultsTableView.reloadData()
        self.searchResultsTableView.isHidden = false
        sender.endRefreshing()
    }
    // MARK: - Data Methods
    func searchMovies(searchWord: String) {
        Task.init {
            if let searchedMovies = await searchViewModel.fetchMovies(searchWord: searchWord) {
                self.searchViewModel.movies = searchedMovies
                DispatchQueue.main.async {
                    if searchedMovies.isEmpty {
                        self.searchResultsTableView.isHidden = true
                        self.labelConfig()
                    } else {
                        self.searchResultsTableView.isHidden = false
                        self.searchResultsTableView.reloadData()
                        self.activityIndicator.stopAnimating()
                    }
                }
            } else {
                presentAlert(title: "Error While Fetching Movies.", message: "")
            }
        }
    }
}
