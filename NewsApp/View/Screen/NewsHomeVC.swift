//
//  NewsHomeVC.swift
//  NewsApp
//
//  Created by Mouli Agastya on 9/14/26.
//

import UIKit

class NewsHomeVC: UIViewController {
    let viewModel: NewsHomeViewModelProtocol!
    
    init(viewModel: NewsHomeViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let searchInput: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.widthAnchor.constraint(equalToConstant: 380).isActive = true
        searchBar.placeholder = Constant.newsHeading.rawValue
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    private let newsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: NewsTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "News"
        self.view.backgroundColor = .systemBackground
        newsTableView.dataSource = self
        setUpUI()
        
        fetchNews()
    }
    
    func setUpUI() {
        view.addSubview(searchInput)
        view.addSubview(newsTableView)
        
        NSLayoutConstraint.activate([
            searchInput.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchInput.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            
            newsTableView.topAnchor.constraint(equalTo: searchInput.bottomAnchor, constant: 5),
            newsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            newsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func fetchNews() {
        viewModel?.fetchNews {
            DispatchQueue.main.async { [weak self = self] in
                self?.newsTableView.reloadData()
            }
        }
    }
}

extension NewsHomeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getTotalNewsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier) as? NewsTableViewCell
        cell?.loadCellData(item: viewModel.getNews(for: indexPath.row))
        
        return cell ?? UITableViewCell()
    }
}

