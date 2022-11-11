//
//  ViewController.swift
//  Rick&Morty_TestTask
//
//  Created by Поляндий on 11.11.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var charactersModels = [CharacterTableViewCellModel]()
    private var characters = [Characters]()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(CharacterTableViewCell.self, forCellReuseIdentifier: "CharacterTableViewCell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Characters"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        view.backgroundColor = .systemBackground
        
        NetworkManager.network.getCharacters { [weak self] result in
            switch result{
            case .success(let characters):
                self?.characters = characters
                self?.charactersModels = characters.compactMap({
                    CharacterTableViewCellModel(name: $0.name,
                                                status: $0.status,
                                                species: $0.species,
                                                gender: $0.gender,
                                                origin: $0.origin.name,
                                                imageURL: URL(string: $0.image))
                })
                
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return charactersModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterTableViewCell", for: indexPath) as? CharacterTableViewCell else {
            fatalError()
        }
        cell.configure(with: charactersModels[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 152
    }
}

