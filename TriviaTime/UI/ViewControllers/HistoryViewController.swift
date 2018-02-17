//
//  HistoryViewController.swift
//  TriviaTime
//
//  Created by Eliel A. Gordon on 11/29/17.
//  Copyright © 2017 Eliel Gordon. All rights reserved.
//

import UIKit
import RealmSwift


/// Displays a history of all answered trivia questions from Realm
class HistoryViewController: UIViewController {
    
    let realm = try! Realm()
    
    @IBOutlet weak var tableView: UITableView!
    let dataSource = TableDatasource(items: [])
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "History"
        
        self.navigationController?
            .navigationBar
            .setBackgroundImage(UIImage(), for: .default)
        
        self.navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedStringKey.font: UIFont.systemFont(ofSize: 30, weight: .black),
            NSAttributedStringKey.foregroundColor: UIColor.white
        ]
        
//        tableView.dataSource = dataSource
        
        //TODO: Fill me in with history details
        let questions = realm.objects(Question.self)
        let arrayQuestions = Array(questions)
        
        
        dataSource.items = arrayQuestions
        
        tableView.dataSource = dataSource
        
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
        dataSource.configureCell = { (tableView, indexPath) -> UITableViewCell in
            let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell")! 
            cell.textLabel?.text = arrayQuestions[indexPath.row].query
            if arrayQuestions[indexPath.row].correct == false {
                cell.detailTextLabel?.text = "Wrong!"
            } else {
                cell.detailTextLabel?.text = "Right!"
            }
            
            return cell
        }
        
        tableView.estimatedRowHeight = 55
    }
    
    
}
