//
//  ViewController.swift
//  iPartner-TestApp
//
//  Created by Michael Sidoruk on 24/09/2019.
//  Copyright © 2019 Michael Sidoruk. All rights reserved.
//

import UIKit

enum State {
    case loading
    case error
    case populated
}

class MainVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var updateView: UIView!
    @IBOutlet weak var loadingView: UIView!
    
    private var state = State.loading {
        didSet {
            setFooterView()
            tableView.reloadData()
        }
    }
    
    private let api = NetworkService()

    private var wishes: [Wish]?
    private var wishToPass: Wish!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadData()
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: Identifiers.WishCell, bundle: nil),
                           forCellReuseIdentifier: Identifiers.WishCell)
    }
    
    private func loadData() {
        state = .loading
        guard let session = SESSION else { return }
        let paramenters = ["a": "get_entries",
                             "session": session]
        api.postEntries(url: URL_BASE, parameters: paramenters) { [unowned self] (response) in
            guard let response = response else { self.state = .error; return }
            for item in response.data {
                self.wishes = item
            }
            self.state = .populated
        }
    }
    
    private func setFooterView() {
          switch state {
          case .loading:
              tableView.tableFooterView = loadingView
              activityIndicator.startAnimating()
          case .error:
              tableView.tableFooterView = updateView
          case .populated:
              tableView.tableFooterView = nil
          }
      }
    
    
    @IBAction func updatePressed(_ sender: Any) {
        loadData()
    }
    
}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wishes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.WishCell, for: indexPath) as? WishCell {
            cell.updateUI(wish: wishes?[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        wishToPass = wishes?[indexPath.row]
        performSegue(withIdentifier: Segues.ToDetailWishVC, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segues.ToDetailWishVC {
            if let vc = segue.destination as? DetailWishVC {
                vc.wish = wishToPass
            }
        }
    }
}
