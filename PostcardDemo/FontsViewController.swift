//
//  FontsViewController.swift
//  PostcardDemo
//
//  Created by Tinnell, Clay on 10/2/17.
//  Copyright © 2017 Tinnell, Clay. All rights reserved.
//

import UIKit

class FontsViewController: UITableViewController {

    let fonts = UIFont.familyNames.sorted()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fonts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let fontName = fonts[indexPath.row]
        
        cell.textLabel?.text = fontName
        cell.textLabel?.font = UIFont(name: fontName, size: 18)
        
        return cell
    }
    
}
