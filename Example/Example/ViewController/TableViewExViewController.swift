//
//  TableViewExViewController.swift
//  Example
//
//  Created by 余汪送 on 2018/6/8.
//  Copyright © 2018年 capsule. All rights reserved.
//

import UIKit
import UITableView_FDTemplateLayoutCell

class TableViewExViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    lazy var tableView: UITableView = {
        let tb = UITableView(frame: .zero, style: .plain)
        tb.delegate = self
        tb.dataSource = self
        tb.register(FeedTableViewCell.self, forCellReuseIdentifier: "cell")
        return tb
    }()
    
    lazy var data: [Feed] = {
        let path = Bundle.main.path(forResource: "data", ofType: "json")
        if let path = path {
            let url = URL(fileURLWithPath: path)
            let data = try? Data(contentsOf: url)
            if let jsonData = data {
                if let feedList = try? JSONDecoder().decode([Feed].self, from: jsonData) {
                    return feedList
                }
            }
        }
        return []
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        configuration(cell: cell, at: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.fd_heightForCell(withIdentifier: "cell", configuration: { (cell) in
            if let cell = cell as? UITableViewCell {
                self.configuration(cell: cell, at: indexPath)
            }
        })
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func configuration(cell: UITableViewCell, at indexPath: IndexPath) {
        guard let cell = cell as? FeedTableViewCell else {
            return
        }
        cell.feed = data[indexPath.row]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
