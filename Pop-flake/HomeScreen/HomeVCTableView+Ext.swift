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
            return 200
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
    //    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
    //        let titleView = view as? UITableViewHeaderFooterView
    //        // titleView?.textLabel?.text = titleView?.textLabel?.text?.localizedCapitalized
    //        titleView?.textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    //        titleView?.textLabel?.textColor = .white
    //     }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let comingSooncell = homeTableView.dequeueReusableCell(withIdentifier: K.commingSoonTableViewCell,
                                                               for: indexPath) as? CommingSoonTableViewCell
//        if indexPath.section == 3 {
//            let grossingcell = homeTableView.dequeueReusableCell(withIdentifier: K.grossingTableViewCell
//                                                                 ,for: indexPath) as? GrossingTableViewCell
   //         return grossingcell!
  //      } else {
            return comingSooncell!
       // }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        homeTableView.deselectRow(at: indexPath, animated: true)
    }
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let header = homeTableView.dequeueReusableHeaderFooterView(withIdentifier: K.homeTableViewHeaderID)
//        return header
//    }
}
//        switch indexPath.section {
//        case 0:
//            return comingSooncell!
//        case 1:
//            return comingSooncell!
//        case 2:
//            return comingSooncell!
//        case 3:
//
//            return grossingcell!
//        default:
//           return comingSooncell!
//        }

