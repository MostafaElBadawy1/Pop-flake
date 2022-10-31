//
//  SafariViewController.swift
//  Pop-flake
//
//  Created by Mostafa Elbadawy on 31/10/2022.
//

import UIKit
import WebKit
class SafariViewController: UIViewController {
    let webView = WKWebView()
    var movieId: URL?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
                if let movieUrl = movieId {
                    webView.load(URLRequest(url: movieUrl))
                    print(movieUrl)
                }
       // let movieUrl = URL(string: "https://www.imdb.com/title/tt6723592/")
       // webView.load(URLRequest(url: movieId!))
//        if let movieUrl = movieId {
//            webView.load(URLRequest(url: movieUrl))
//            print(movieUrl)
//        }
        // safariViewConfig()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }
    }
