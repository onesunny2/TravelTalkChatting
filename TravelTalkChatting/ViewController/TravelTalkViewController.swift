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
    
    var forCellList: [ChatRoom] = [] {
        didSet {
            chatCollectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        forCellList = mockChatList

        chatCollectionView.delegate = self
        chatCollectionView.dataSource = self
        
        chatSearchBar.delegate = self
        
        registerCells()
        configCollectionViewLayout()
        confingSearchBar()
        
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .label
    }


}

// MARK: - SearchBar 관련
extension TravelTalkViewController: UISearchBarDelegate {
    
    func confingSearchBar() {
        // 화면 스크롤 시도할 때 키보드 내려가는 모드
        chatCollectionView.alwaysBounceVertical = true
        chatCollectionView.keyboardDismissMode = .onDrag
        
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
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        /* ✅ 아래 주석이 처음 시도했던 방법 - 한국어 필터링이 안되었었음
              -> 원본 배열에 대한 필터링을 하면서 원본배열을 바꿔버려서 그랬던 것!
              특히 한국어는 '원' 이런식으로 뭉치는데 ㅇㅜㅓ이런식으로 걸러져버려서
              (필터링은 절대 변하지 않는 원본에서 하고 최종 필터된 것을 cell에 갈아끼울 배열에 넣자)
        forCellList = searchText.isEmpty ? mockChatList : forCellList.filter { $0.chatroomName.lowercased().contains(searchText.lowercased()) } */
        
        var filtered: [ChatRoom] = []
        filtered = searchText.isEmpty ? mockChatList : mockChatList.filter { $0.chatroomName.lowercased().contains(searchText.lowercased()) }
        print(filtered, searchText)
        
        forCellList = filtered
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
        return forCellList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let list = forCellList[indexPath.row]  // 주어진 indexPath나 쓰자.. 무슨 부귀영화를 누리겠다고 고차함수 써보겠다며 시간낭비 한 것
        
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // 다음 채팅화면으로 들어가는 네비게이션 화면 전환
        let sb = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: ChattingViewController.identifier) as? ChattingViewController else { return }
        
        vc.listIndex = indexPath.item
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

/*
 네비게이션 전환방법 순서 되짚기
 1. 스토리보드 네임 등록
 2. 뷰 컨트롤러 등록
 3. 화면 넘겨주기
 */
