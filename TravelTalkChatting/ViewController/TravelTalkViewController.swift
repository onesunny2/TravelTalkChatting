//
//  TravelTalkViewController.swift
//  TravelTalkChatting
//
//  Created by Lee Wonsun on 1/10/25.
//

import UIKit

class TravelTalkViewController: UIViewController {

    @IBOutlet var chatSearchBar: UISearchBar!
    @IBOutlet var chatCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        chatCollectionView.delegate = self
        chatCollectionView.dataSource = self
        
        registerCells()
    }


}


// MARK: - CollectionView 설정
extension TravelTalkViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func registerCells() {
        let xib1 = UINib(nibName: SingleChatCollectionViewCell.identifier, bundle: nil)
        chatCollectionView.register(xib1, forCellWithReuseIdentifier: SingleChatCollectionViewCell.identifier)
        
        let xib2 = UINib(nibName: MultiChatCollectionViewCell.identifier, bundle: nil)
        chatCollectionView.register(xib2, forCellWithReuseIdentifier: MultiChatCollectionViewCell.identifier)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
}
