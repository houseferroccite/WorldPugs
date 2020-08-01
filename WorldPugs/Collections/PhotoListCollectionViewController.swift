//
//  PhotoListCollectionViewController.swift
//  WorldPugs
//
//  Created by Алексей Зимовец on 28.07.2020.
//  Copyright © 2020 Алексей Зимовец. All rights reserved.
//

import UIKit


class PhotoListCollectionViewController: UICollectionViewController {

    
    let photos = ["dog1","dog2","dog3","dog4","dog5","dog6","dog7","dog8","dog9","dog10","dog11","dog12", "dog13", "dog14", "dog15"]
    
    let sectionInsert = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    let itemPerRow: CGFloat = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        print(photos.count)
        
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Item", for: indexPath) as! photoCell
    
        let imageName = photos[indexPath.item]
        let image = UIImage(named: imageName)
        cell.ImageView.image = image
        return cell
    }
}

extension PhotoListCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingWidth = sectionInsert.left * (itemPerRow + 1)
        let aviableWidth = collectionView.frame.width - paddingWidth
        let widthPerItem = aviableWidth / itemPerRow
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsert
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsert.left
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsert.left
    }
}
