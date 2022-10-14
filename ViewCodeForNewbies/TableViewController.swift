//
//  TableViewController.swift
//  ViewCodeForNewbies
//
//  Created by Alfin on 14/10/22.
//

import UIKit

class TableViewController: ViewController, UITableViewDelegate, UITableViewDataSource  {
    private let data = (0..<20).map { number in "Data #\(number)" }
    
    private var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView(frame: view.bounds)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.dataSource = self
        tableView.delegate = self
        
        self.view.addSubview(tableView)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath)
        
        cell.textLabel!.text = data[indexPath.row]
        
        return cell
    }
    
}
