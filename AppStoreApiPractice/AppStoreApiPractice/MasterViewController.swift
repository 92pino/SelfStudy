//
//  ViewController.swift
//  AppStoreApiPractice
//
//  Created by JinBae Jeong on 02/07/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit
import Alamofire

class MasterViewController: UITableViewController {
    
    // MARK: - Properties
    @IBOutlet weak var titleImageView: UIImageView!
    
    var detailViewController: DetailViewController? = nil
    var objects = NSMutableArray()
    
    private var reachability: NetworkReachabilityManager!
    
    // MARK: - View Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        navigationItem.titleView = titleImageView
        clearsSelectionOnViewWillAppear = true
        
        monitorReachability()
    }
    
    // MARK: - UIStoryboardSegue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if
            let navigationController = segue.destination as? UINavigationController,
            let detailViewController = navigationController.topViewController as? DetailViewController
        {
            func requestForSegue(_ segue: UIStoryboardSegue) -> Request? {
                switch segue.identifier! {
                case "GET":
                    detailViewController.segueIdentifier = "GET"
                    return AF.request("https://httpbin.org/get")
                case "POST":
                    detailViewController.segueIdentifier = "POST"
                    return AF.request("https://httpbin.org/post", method: .post)
                case "PUT":
                    detailViewController.segueIdentifier = "PUT"
                    return AF.request("https://httpbin.org/put", method: .put)
                case "DELETE":
                    detailViewController.segueIdentifier = "DELETE"
                    return AF.request("https://httpbin.org/delete", method: .delete)
                case "DOWNLOAD":
                    detailViewController.segueIdentifier = "DOWNLOAD"
                    let destination = DownloadRequest.suggestedDownloadDestination(
                        for: .cachesDirectory,
                        in: .userDomainMask
                    )
                    return AF.download("https://httpbin.org/stream/1", to: destination)
                default:
                    return nil
                }
            }
            
            if let request = requestForSegue(segue) {
                detailViewController.request = request
            }
        }
    }
    
    // MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 3 && indexPath.row == 0 {
            print("Reachability Status: \(reachability.networkReachabilityStatus)")
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    // MARK: - Private - Reachability
    private func monitorReachability() {
        reachability = NetworkReachabilityManager(host: "www.apple.com")
        
        reachability.listener = { status in
            print("Reachability Status Changed: \(status)")
        }
        
        reachability.startListening()
    }
}
