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
        chatCollectionView.keyboardDismissMode = .interactive  // TODO: 작동여부 확인 필요
        
        chatSearchBar.delegate = self
        
        registerCells()
        configCollectionViewLayout()
        confingSearchBar()
    }


}

// MARK: - SearchBar 관련
extension TravelTalkViewController: UISearchBarDelegate {
    
    func confingSearchBar() {
        chatSearchBar.placeholder = "친구 이름을 검색해보세요!"
        chatSearchBar.keyboardType = .default
        chatSearchBar.showsCancelButton = false
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
        searchBar.setShowsCancelButton(false, animated: true)
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(false, animated: true)
        view.endEditing(true)
    }
    
}

// MARK: - collectionView layout 설정
extension TravelTalkViewController {
    
    func configCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSizeMake(UIScreen.main.bounds.width - 40, 90)
        layout.sectionInset = UIEdgeInsets(top: 4, left: 20, bottom: 4, right: 20)
        layout.minimumLineSpacing = 0
        
        chatCollectionView.collectionViewLayout = layout
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
        return mockChatList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let list = mockChatList[indexPath.row]  // 주어진 indexPath나 쓰자.. 무슨 부귀영화를 누리겠다고 고차함수 써보겠다며 시간낭비 한 것
        
        if list.chatroomImage.count != 1 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MultiChatCollectionViewCell.identifier, for: indexPath) as? MultiChatCollectionViewCell else { return UICollectionViewCell() }
            
            cell.configMulticell(list)

            
            return cell
            
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SingleChatCollectionViewCell.identifier, for: indexPath) as? SingleChatCollectionViewCell else { return UICollectionViewCell() }
            
            cell.configSinglecell(list)
            
            return cell
        }
    }
}
