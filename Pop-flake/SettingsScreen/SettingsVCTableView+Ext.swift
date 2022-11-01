//
//  SettingsVCTableView+Ext.swift
//  Pop-flake
//
//  Created by Mostafa Elbadawy on 31/10/2022.
//
import UIKit
extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = settingsTableView.dequeueReusableCell(withIdentifier:
                                                            K.settingsTableViewCell) as? SettingsTableViewCell
        switch indexPath.row {
        case 0:
            cell?.settingsLabel.text = "Dark Mode"
        default:
            cell?.settingsLabel.text = "Send Complaints"
            cell?.switchControl.isHidden = true
            cell?.accessoryType = .disclosureIndicator
        }
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        settingsTableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 1 {
            let formVC = UIStoryboard(name: "Main",
                                      bundle: nil).instantiateViewController(withIdentifier: K.complaintFormViewControllerID) as? ComplaintFormViewController
            navigationController?.pushViewController(formVC!, animated: true)
        }
    }
}
