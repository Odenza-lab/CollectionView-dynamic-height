//
//  ViewController.swift
//  CollectionViewAutoLayout
//
//  Created by ODENZA on 18/9/2564 BE.
//

import UIKit

let items = [
    "Hello",
    "Lorem Ipsum is simply dummy text of the printing",
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
    " 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
    "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy."
]

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let cellId = "AutoLayoutViewCell"
    
    var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width
        layout.estimatedItemSize = CGSize(width: width, height: 10)
       return layout
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "AutoLayoutViewCell", bundle: nil), forCellWithReuseIdentifier: cellId)
        collectionView.collectionViewLayout = layout
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print(collectionView.contentSize.height)
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AutoLayoutViewCell
        cell.configure(content: items[indexPath.row])
        return cell
    }
}



