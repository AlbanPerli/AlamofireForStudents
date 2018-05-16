//
//  ViewController.swift
//  AlamofireExample
//
//  Created by AL on 15/05/2018.
//  Copyright © 2018 Alban. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var photosArray = [Photo]()
    var selectedIndex:Int = 0
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        tableView.dataSource = self
        tableView.delegate = self
        
        NetworkManager.shared.getPhotos { photos in
            self.photosArray = photos
            self.refreshView()
        }
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func refreshView() {
        tableView.reloadData()
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetails" {
            if let destVC = segue.destination as? DetailsTableViewController {
                destVC.photoModel = photosArray[selectedIndex]
            }
        }
    }

}

extension ViewController:UITableViewDelegate {
    // MARK: TableView Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        self.performSegue(withIdentifier: "toDetails", sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
}

extension ViewController:UITableViewDataSource {
    // MARK: TableView Datasource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photosArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        let photo = photosArray[indexPath.row]
        cell.label.text = photo.title
        if let url = URL(string: photo.url) {
            cell.imgView.af_setImage(withURL: url, placeholderImage: nil, filter: nil, progress: nil, progressQueue: DispatchQueue.main, imageTransition: UIImageView.ImageTransition.noTransition, runImageTransitionIfCached: false, completion: nil)
            
        }
        return cell
    }
    
}

