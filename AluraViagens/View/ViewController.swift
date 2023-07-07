//
//  ViewController.swift
//  AluraViagens
//
//  Created by Mauricio Silva on 04/07/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var viagensTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuraTableView()
        viagensTableView.dataSource = self
        viagensTableView.delegate = self
        // Fundo da view
        view.backgroundColor = UIColor(red: 30.0/255.0, green: 59.0/255.0, blue: 119.0/255.0, alpha: 1)
    }
    
    func configuraTableView(){
        viagensTableView.register(UINib(nibName: "ViagemTableViewCell", bundle: nil), forCellReuseIdentifier: "ViagemTableViewCell")
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sessaoDeViagens?[section].numeroDeLinhas ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let celulaViagem = tableView.dequeueReusableCell(withIdentifier: "ViagemTableViewCell") as? ViagemTableViewCell else {
            fatalError("error to create ViagemTableViewCell")
        }
        
        let viewModel = sessaoDeViagens?[indexPath.section]
        
        switch viewModel?.tipo {
        case .destaques:
            celulaViagem.configuraCelula(viewModel?.viagens[indexPath.row])
        default:
            return UITableViewCell()
        }
        
        return celulaViagem
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = Bundle.main.loadNibNamed("HomeTableViewHeader", owner: self, options: nil)?.first as? HomeTableViewHeader
        headerView?.configuraView()
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? 400 : 475
    }
}
