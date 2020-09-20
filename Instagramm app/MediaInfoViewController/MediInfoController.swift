//
//  MediInfoController.swift
//  Instagramm app
//
//  Created by George Kyrylenko on 21.09.2020.
//  Copyright © 2020 TestApp. All rights reserved.
//

import UIKit
import Kingfisher

class MediInfoController: UIViewController {
    @IBOutlet weak var previewImageeView: UIImageView!
    @IBOutlet weak var accessibilityCaptionLabel: UILabel!
    
    var media: EdgeFelixVideoTimelineEdge?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setData()
        // Do any additional setup after loading the view.
    }
    
    func setData(){
        let url = URL(string: media?.node?.displayURL ?? "")
        previewImageeView.kf.setImage(with: url)
        accessibilityCaptionLabel.text = media?.node?.accessibilityCaption
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
