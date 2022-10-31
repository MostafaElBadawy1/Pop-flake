//
//  MainViewController.swift
//  Pop-flake
//
//  Created by Mostafa Elbadawy on 30/10/2022.
//
import UIKit
class MainViewController: UIViewController {
    let refreshControl = UIRefreshControl()
    let activityIndicator = UIActivityIndicatorView(style: .medium)
    //    func tableViewConfig<Cell: UITableViewCell>(tableView: UITableView, rowHeight: CGFloat, cellClass: Cell.Type) {
      //      tableView.rowHeight = rowHeight
      //      tableView.registerCellNib(cellClass: cellClass)
//            refreshControl.addTarget(self, action: #selector(refreshTableView), for: .valueChanged)
//            tableView.refreshControl = refreshControl
   // }
    func presentAlert (title: String, message: String) {
        let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    func networkReachability(loadingIndicator: UIActivityIndicatorView) {
        loadingIndicator.style = .medium
        loadingIndicator.center = view.center
        view.addSubview(loadingIndicator)
        if NetworkMonitor.shared.isConnected {
            loadingIndicator.stopAnimating()
        } else {
            presentAlert(title: "You Are Disconnected", message: "Please Check Your Connection!")
            loadingIndicator.startAnimating()
        }
    }
    func refresh(tableView: UITableView) {
    refreshControl.addTarget(self, action: #selector(refreshTableView), for: .valueChanged)
    tableView.refreshControl = refreshControl
}
@objc func refreshTableView(refreshControl: UIRefreshControl) {
    refreshControl.endRefreshing()
}
}
