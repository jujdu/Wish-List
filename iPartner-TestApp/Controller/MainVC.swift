//
//  ViewController.swift
//  iPartner-TestApp
//
//  Created by Michael Sidoruk on 24/09/2019.
//  Copyright © 2019 Michael Sidoruk. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let api = NetworkService()
    let newSession = ["a": "new_session"]
    let getParameters = ["a": "get_entries", "session": "VUFPv1ght0yTV4VqPU"]
    
    var wishes: [Wish]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        api.postEntries(url: URL_BASE, parameters: getParameters) { [unowned self] (response) in
            guard let response = response else { return }
            for item in response.data {
                self.wishes = item
            }
            self.tableView.reloadData()
        }
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: Identifiers.WishCell, bundle: nil),
                           forCellReuseIdentifier: Identifiers.WishCell)
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
}
