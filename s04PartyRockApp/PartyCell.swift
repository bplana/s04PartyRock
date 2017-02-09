//
//  PartyCell.swift
//  s04PartyRockApp
//
//  Created by bernadette on 2/8/17.
//  Copyright © 2017 Bernadette P. All rights reserved.
//

import UIKit

class PartyCell: UITableViewCell {

    @IBOutlet weak var videoPreviewImage: UIImageView!
    
    @IBOutlet weak var videoTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    
        
    }

    // everytime we create a new cell, we call updateUI
    func updateUI(partyRock: PartyRock) {
        
        // ~~ add title for cell
        videoTitle.text = partyRock.videoTitle
        
        // when downloading from the internet (tasks that may take a while), NEED TO PUT IT IN AN ASYNCHRONOUS THREAD
        
        // ~~ download an image for each of those cells
        // convert string into a URL
        let url = URL(string: partyRock.imageURL)!
        
        // will create a new thread in the background that won't stop the app from updating (not for UI)
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                
                // synchronous is main thread
                // ~~ put the image in the image view
                DispatchQueue.global().sync {
                    self.videoPreviewImage.image = UIImage(data: data)
                }
            } catch {
                // handle the error
            }
        }
        
        
    }


}
