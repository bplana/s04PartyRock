//
//  ViewController.swift
//  s04PartyRockApp
//
//  Created by bernadette on 2/2/17.
//  Copyright © 2017 Bernadette P. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // add UITableViewDelegate, UITableViewDataSource - then implement required protocols
    
    // when working with a TableView, you will need an IBOutlet for it, the 2 above protocols, implement required functions, & set a delegate (tableView.delegate = self / tableView.dataSource = self)
    
    @IBOutlet weak var tableView: UITableView!
    
    var partyRocks = [PartyRock]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // add backslashes before each quotation mark
        // need to allow just 'http' urls to be available in the app (Info.plist) --> App Transport Security Settings > Allow Arbitrary Loads > YES
        
        // create new instance of the class (PartyRock class) to create an object
        let p1 = PartyRock(imageURL: "https://i.ytimg.com/vi/ev4bY1SkZLg/hqdefault.jpg?custom=true&w=120&h=90&jpg444=true&jpgq=90&sp=68&sigh=wu8nQ4Kj5WblFEVyVw_ZovfCLMg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/ev4bY1SkZLg?list=PLtM4rw7sjPKUe0YW6Fmrp2FSU7RxkX-JA\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Lights Out")
        
        let p2 = PartyRock(imageURL: "https://i.ytimg.com/vi/1w9DiGlZksU/hqdefault.jpg?custom=true&w=120&h=90&jpg444=true&jpgq=90&sp=68&sigh=g1DTXpaVLQhtf9fTu3hAUMjKykI", videoURL: "<iframe width=\"640\" height=\"360\" src=\"https://www.youtube.com/embed/1w9DiGlZksU?list=PLtM4rw7sjPKUe0YW6Fmrp2FSU7RxkX-JA\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Let's Get Ridiculous")
        
        let p3 = PartyRock(imageURL: "https://i.ytimg.com/vi/vg_nvEGryA4/hqdefault.jpg?custom=true&w=120&h=90&jpg444=true&jpgq=90&sp=68&sigh=ai4mZWEuWypt_ToYyylctVzYWEg", videoURL: "<iframe width=\"640\" height=\"360\" src=\"https://www.youtube.com/embed/vg_nvEGryA4\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Juicy Wiggle Lesson")
        
        let p4 = PartyRock(imageURL: "https://i.ytimg.com/vi/gZIqW92GaTQ/hqdefault.jpg?custom=true&w=120&h=90&jpg444=true&jpgq=90&sp=68&sigh=2PxhyggkFTZeAR8_zGs-LD0twro", videoURL: "<iframe width=\"640\" height=\"360\" src=\"https://www.youtube.com/embed/gZIqW92GaTQ?list=PLtM4rw7sjPKVh_rA6BmWreGcIw5CK9yxJ\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Party Rock Commercial")
        
        let p5 = PartyRock(imageURL: "https://i.ytimg.com/vi/tWyuglGCKgE/hqdefault.jpg?custom=true&w=120&h=90&jpg444=true&jpgq=90&sp=68&sigh=tZWE9Yflbx0HxzeO9ZZ3Zk51hHo", videoURL: "<iframe width=\"640\" height=\"360\" src=\"https://www.youtube.com/embed/tWyuglGCKgE?list=PLtM4rw7sjPKUe0YW6Fmrp2FSU7RxkX-JA\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Juicy Wiggle")
        
        
        // add that object on that p1...
        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)
        partyRocks.append(p4)
        partyRocks.append(p5)
        
        
        tableView.delegate = self
        tableView.dataSource = self
    
    }

    // required protocol - 'cellForRowAt indexPath'
    // 'return UITableViewCell()' for now
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell {
            
            let partyRock = partyRocks[indexPath.row]
            
            cell.updateUI(partyRock: partyRock)
            
            return cell
            
        } else {
            return UITableViewCell()
        }
        
        return UITableViewCell()
    }
    
    // required protocol - 'numberOfRowsInSection'
    // 'return 0' for now
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // we know we want to return the number partyRocks data items (see var partyRocks)
        return partyRocks.count
    }
    
    // for when user taps on the cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let partyRock = partyRocks[indexPath.row]
        
        performSegue(withIdentifier: "VideoVC", sender: partyRock)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? VideoVC {
            
            if let party = sender as? PartyRock {
                destination.partyRock = party
            }
        }
    }
    


}

