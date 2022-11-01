//
//  HomeVCTableView+Ext.swift
//  Pop-flake
//
//  Created by Mostafa Elbadawy on 30/10/2022.
//
import UIKit
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 3:
            return 500
        default:
            return 250
        }
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Coming Soon"
        case 1:
            return "In Theaters"
        case 2:
            return "Top 250"
        default:
            return "Grossing"
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let comingSooncell = homeTableView.dequeueReusableCell(withIdentifier:
                                                                K.commingSoonTableViewCell) as? CommingSoonTableViewCell
        let inTheatercell = homeTableView.dequeueReusableCell(withIdentifier:
                                                                K.inTheatersTableViewCellID) as? InTheatersTableViewCell
        let top250cell = homeTableView.dequeueReusableCell(withIdentifier:
                                                            K.top250TableViewCellID) as? Top250TableViewCell
        let grossingcell = homeTableView.dequeueReusableCell(withIdentifier:
                                                                K.grossingTableViewCell) as? GrossingTableViewCell
        switch indexPath.section {
        case 0:
            return comingSooncell!
        case 1:
            return inTheatercell!
        case 2:
            return top250cell!
        default:
            return grossingcell!
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        homeTableView.deselectRow(at: indexPath, animated: true)
    }
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let header = homeTableView.dequeueReusableHeaderFooterView(withIdentifier: K.homeTableViewHeaderID)
//        return header
//    }
}
