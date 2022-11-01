//
//  FormViewController.swift
//  Pop-flake
//
//  Created by Mostafa Elbadawy on 01/11/2022.
//
import UIKit
import Eureka
class ComplaintFormViewController: FormViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Complaints Form"
        form +++ Section()
        <<< TextRow("Name") { row in
            row.title = "Name"
            row.placeholder = "Type in your full name"
        }
        <<< TextRow("Phone Number") { row in
            row.title = "Complaint"
            row.placeholder = "Type in your Phone Number"
        }
        <<< EmailRow("Email") { row in
            row.title = "Email"
            row.placeholder = "Type in your email"
        }
        <<< TextRow("Complaint") { row in
            row.title = "Complaint"
            row.placeholder = "Tell Us Your Complaint"
        }
        <<< ButtonRow("Sumbit Row") {row in
            row.title = "Submit"
        }.onCellSelection({ _, _ in
            print(self.form.values())
        })
    }
}
