//
//  LanceALanceController.swift
//  brasileirao
//
//  Created by Ana Julia on 2/10/20.
//  Copyright © 2020 Ana Julia. All rights reserved.
//

import UIKit

class LanceALanceController: UITableViewController{
    
    @IBOutlet var siglaTimeCasa: UILabel!
    @IBOutlet var siglaTimeVisitante: UILabel!
    @IBOutlet var escudoCasa: UIImageView!
    @IBOutlet var escudoVisitante: UIImageView!
    @IBOutlet var golsCasa: UILabel!
    @IBOutlet var golsVisitante: UILabel!
    @IBOutlet var segmentedControlDetalhes: UISegmentedControl!
    @IBOutlet var header: UIView!
    
    var apiClient = APIClient()
    
    var idJogo: Int = 1
    var jogoSelecionado : JogoModel?
    
    var lances : [LanceALanceModel] = []
    var ficha : FichaModel?
    
    var segmentSelected : Int = 0
        
    override func viewDidLoad() {
        super.viewDidLoad()
        requisitionLanceAPI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        stylizeSegmentControl()
        completeHeader()
    }
    
    @IBAction func indexChanged(_ sender: Any) {
        
        switch segmentedControlDetalhes.selectedSegmentIndex {
        case 0:
            segmentSelected = 0
            requisitionLanceAPI()
        default:
            segmentSelected = 1
            requisitionFichaAPI()
        }
    }
    
    func requisitionLanceAPI(){
        let route = AppRoute.lances(jogo: idJogo)

        apiClient.request(route: route) { (data, error) in
            if let error = error{
                print(error)
                return
            }

            guard let data = data else { return }

            do{
                let lance = try JSONDecoder().decode([LanceALanceModel].self, from: data)
                self.lances = lance

                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }

            }catch{
                print(error)
            }
        }
    }
    
    func requisitionFichaAPI(){
        print("entrou")
        let route = AppRoute.ficha(jogo: idJogo)
        
        apiClient.request(route: route) { (data, error) in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else { return }
            
            do{
                let ficha = try JSONDecoder().decode(FichaModel.self, from: data)
                self.ficha = ficha
                print(ficha)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }catch{
                print(error)
            }
        }
    }
    
    func stylizeSegmentControl() {
        let font = UIFont.systemFont(ofSize: 18)

        let titleTextAttributes = [NSAttributedString.Key
            .foregroundColor: UIColor.white,
            .font: font]

        segmentedControlDetalhes.setTitleTextAttributes(titleTextAttributes, for: .selected)
        segmentedControlDetalhes.setTitleTextAttributes(titleTextAttributes, for: .normal)
        

    }
    
    func completeHeader(){
        guard let jogoSelected = jogoSelecionado else {return}
        
        let siglaCasa = jogoSelected.timeCasa.sigla.uppercased()
        let siglaVisitante = jogoSelected.timeVisitante.sigla.uppercased()
            
        self.title = "\(siglaCasa) x \(siglaVisitante)"

        self.escudoCasa.load(jogoSelected.timeCasa.urlEscudo)
        self.escudoVisitante.load(jogoSelected.timeVisitante.urlEscudo)
        self.golsCasa.text = String(jogoSelected.timeCasa.gols)
        self.golsVisitante.text = String(jogoSelected.timeVisitante.gols)
        self.siglaTimeCasa.text = siglaCasa
        self.siglaTimeVisitante.text = siglaVisitante
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        if segmentSelected == 0 { return 1 }
        else { return 3 }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if numberOfSections(in: tableView) == 1 { return lances.count}
                
        switch section {
            case 0:
                return 2
            case 1:
                return 11
            case 2:
                return 12
            default:
                return  1
        }
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if segmentSelected == 0 { return nil }
        switch section {
            case 0:
                return "Informações Gerais"
            case 1:
                return "Titulares"
            case 2:
                return "Reservas"
            default:
                return "Sem título"
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor(red: 0.2, green: 0.64, blue: 0.3, alpha: 1)
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        header.textLabel?.textColor = UIColor.white
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print (indexPath.section)

        if segmentSelected == 0 {
            let lance = lances[indexPath.row]

            var cellIdentfier = "cellLance"
                    
            if lance.tipo == "SUBSTITUICAO"{
                cellIdentfier = "cellLanceSubstituicao"
            }
            else if lance.tipo == "FIMJOGO"{
                cellIdentfier = "cellLanceFimJogo"
            }
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentfier, for: indexPath) as? LanceaLanceTableViewCell else {return UITableViewCell()}
            
            cell.prepare(with: lance)
            
            return cell
            
        }

        else {
            
            var titleCasa: String
            var titleVisitante: String
            var label: String
            
            guard let fichaJogo = ficha else {return UITableViewCell()}

            if indexPath.section == 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellFichaInformacaoAdicional", for: indexPath) as? FichaJogoInformacaoTableViewCell else {return UITableViewCell()}
                
                switch indexPath.row {
                    case 0:
                        titleCasa = fichaJogo.timeCasa.tecnico
                        titleVisitante = fichaJogo.timeVisitante.tecnico
                        label = "Técnico"

                    default:
                        titleCasa = fichaJogo.timeCasa.esquema
                        titleVisitante = fichaJogo.timeVisitante.esquema
                        label = "Esquema"
                }
                
                cell.prepareInformacoes(titleCasa: titleCasa, titleVisitante: titleVisitante, label: label)
                
                return cell
                            
            }
                
            else{
            
                var jogadorCasa : Jogador
                var jogadorVisitante : Jogador
                
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellFichaJogador", for: indexPath) as? FichaJogoTableViewCell else {return UITableViewCell()}
                
                switch indexPath.section {
                    
                    case 1:
                        jogadorCasa = (fichaJogo.timeCasa.jogadores[indexPath.row])
                        jogadorVisitante = (fichaJogo.timeVisitante.jogadores[indexPath.row])
                        
                    default:
                        jogadorCasa = (fichaJogo.timeCasa.reservas[indexPath.row])
                        jogadorVisitante = (fichaJogo.timeVisitante.reservas[indexPath.row])
                }
                
                cell.prepareJogador(jogadorCasa, jogadorVisitante)
            
            return cell
            }
        
        }
        
    }
    
}
