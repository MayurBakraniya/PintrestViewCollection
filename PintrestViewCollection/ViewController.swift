//
//  ViewController.swift
//  PintrestViewCollection
//
//  Created by MAC on 22/10/20.
//

import UIKit

struct Item {
  var imageName: String
}

class ViewController: UIViewController {
    
    var items: [Item] = [Item(imageName: "5"),
                         Item(imageName: "2"),
                         Item(imageName: "8"),
                         Item(imageName: "12"),
                         Item(imageName: "5"),
                         Item(imageName: "6"),
                         Item(imageName: "7"),
                         Item(imageName: "8"),
                         Item(imageName: "9"),
                         Item(imageName: "10"),
                         Item(imageName: "11"),
                         Item(imageName: "12"),
                         Item(imageName: "2"),
                         Item(imageName: "5"),
                         Item(imageName: "7")]
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        collectionView.showsVerticalScrollIndicator = false
        if let layout = collectionView.collectionViewLayout as? CustomLayout{
            layout.delegate = self
        }
    }
}

extension ViewController:  UICollectionViewDataSource, CustomLayoutDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.iamage.image = UIImage(named: items[indexPath.item].imageName)
        cell.clipsToBounds = true
        cell.layer.cornerRadius = 15
        cell.iamage.contentMode = .scaleAspectFill
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, sizeOfPhotoAtIndexPath indexPath: IndexPath) -> CGSize {
        return UIImage(named: items[indexPath.item].imageName)!.size
        
    }
}
