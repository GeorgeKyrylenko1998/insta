//
//  InstagramBioController.swift
//  Instagramm app
//
//  Created by George Kyrylenko on 21.09.2020.
//  Copyright © 2020 TestApp. All rights reserved.
//

import UIKit
import Promises
import Kingfisher

class InstagramBioController: UIViewController {
    
    @IBOutlet weak var mediaCollectionView: UICollectionView!
    
    let instagramApiRepo = InstagramAPI()
    var username: String?
    var media: [EdgeFelixVideoTimelineEdge]?

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareCollectionView()
        loadBio()
        
        // Do any additional setup after loading the view.
    }
    
    func prepareCollectionView(){
        mediaCollectionView.delegate = self
        mediaCollectionView.dataSource = self
    }
    
    func loadBio(){
        guard let username = username else {
            let alert = UIAlertController(title: "Username is empty", message: nil, preferredStyle: .alert)
                       alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                       return
        }
        instagramApiRepo.getUserBio(username: username).then { [weak self] (result) in
            self?.title = result.graphql?.user?.fullName
            self?.media = (result.graphql?.user?.edgeFelixVideoTimeline?.edges ?? []) + (result.graphql?.user?.edgeOwnerToTimelineMedia?.edges ?? [])
            
            self?.mediaCollectionView.reloadData()
         }.catch { (error) in
             print(error.localizedDescription)
         }
    }
}

extension InstagramBioController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return media?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MediaCell", for: indexPath) as? MediaCell else {
            return UICollectionViewCell()
        }
        let url = URL(string: media?[indexPath.row].node?.displayURL ?? "")
        cell.mediaImage.kf.setImage(with: url)
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let width = (self.view.frame.width - 30)/2
        let size = CGSize(width: width, height: width)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         guard let mediaInfoController = self.storyboard?.instantiateViewController(withIdentifier: "MediInfoController") as? MediInfoController else {return}
        mediaInfoController.media = media?[indexPath.row]
        self.navigationController?.pushViewController(mediaInfoController, animated: true)
    }
}
