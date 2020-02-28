//
//  FichaController.swift
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

    var apiClient = APIClient()
    
    var idJogo: Int = 1
    var jogoSelecionado : JogoModel?
    
    var lances : [LanceALanceModel] = []
    var ficha : FichaModel?
    
    var segmentSelected : Int = 1
        
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
        case 1:
            segmentSelected = 1
            requisitionLanceAPI()
        default:
            segmentSelected = 0
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
        if segmentSelected == 1 { return 1 }
        else { return 2 }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if numberOfSections(in: tableView) == 1 { return lances.count}
                
        if section == 0 { return 11 }
        if section == 1 { return 12 }
        //if section == 3 { return 2 }
        
        return 1
        
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 { return "Titulares" }
        if section == 1 { return "Reservas" }
        //if section == 3 { return "Informações adicionais" }
        
        else {return "Algo de errado Aconteceu"}
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print (indexPath.section)

        if segmentSelected == 1 {
            let lance = lances[indexPath.row]

            var cellIdentfier = "cellLance"
                    
            if lance.tipo == "SUBSTITUICAO"{
                cellIdentfier = "cellLanceSubstituicao"
            }
            else if lance.tipo == "FIMJOGO"{
                cellIdentfier = "cellLanceFimJogo"
            }
            
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentfier, for: indexPath) as! LanceaLanceTableViewCell
            
            cell.prepare(with: lance)
            
            return cell
            
        }

        else {
            
            if indexPath.section == 0 {
                
                let titularesCasa = (ficha?.timeCasa.jogadores[indexPath.row])!
                let titularesVisitante = (ficha?.timeVisitante.jogadores[indexPath.row])!
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "cellFichaJogador", for: indexPath) as! FichaJogoTableViewCell
                
                cell.prepareJogador(jogadorCasa: titularesCasa, jogadorVisitante: titularesVisitante)
                
                return cell

            }
            
            else {
                let reservasCasa = (ficha?.timeCasa.reservas[indexPath.row])!
                let reservasVisitante = (ficha?.timeVisitante.reservas[indexPath.row])!
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "cellFichaJogador", for: indexPath) as! FichaJogoTableViewCell
                
                cell.prepareJogador(jogadorCasa: reservasCasa, jogadorVisitante: reservasVisitante)
                
                return cell

            }
           /* else {
                //FAZER ESQUEMA E TÉCNICO APARECER
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "cellFichaInformacoesAdicionais", for: indexPath) as! FichaJogoTableViewCell
                
                cell.prepareInformacoes(with: <#T##FichaModel#>)
                
                return cell
            }
            */
        }
        
        
    }
    
}
