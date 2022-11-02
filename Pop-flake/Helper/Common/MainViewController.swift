//
//  MainViewController.swift
//  Pop-flake
//
//  Created by Mostafa Elbadawy on 30/10/2022.
//
import UIKit
import Network
class MainViewController: UIViewController {
    let monitor = NWPathMonitor()
    let refreshControl = UIRefreshControl()
    let activityIndicator = UIActivityIndicatorView(style: .medium)
    func presentAlert (title: String, message: String) {
        let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    //    func networkReachability(loadingIndicator: UIActivityIndicatorView) {
    //        loadingIndicator.style = .medium
    //        loadingIndicator.center = view.center
    //        view.addSubview(loadingIndicator)
    //        if NetworkMonitor.shared.isConnected {
    //            loadingIndicator.stopAnimating()
    //        } else {
    //            presentAlert(title: "You Are Disconnected", message: "Please Check Your Connection!")
    //            loadingIndicator.startAnimating()
    //        }
    //    }
    func refresh(tableView: UITableView) {
        refreshControl.addTarget(self, action: #selector(refreshTableView), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    @objc func refreshTableView(refreshControl: UIRefreshControl) {}
    func monitorNetwork() {
        monitor.pathUpdateHandler = { path in
            if path .status == .satisfied {
                return
            } else {
                DispatchQueue.main.async {
                    self.presentAlert(title: "You Are Disconnected", message: "Please Check Your Connection!")
                }
            }
        }
        let queue = DispatchQueue(label: "Network")
        monitor.start(queue: queue)
    }
}
