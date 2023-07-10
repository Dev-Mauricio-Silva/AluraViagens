//
//  ViagemOfertaViewModel.swift
//  AluraViagens
//
//  Created by Mauricio Silva on 07/07/23.
//

import Foundation

class ViagemOfertaViewModel: ViagemViewModel {
    var tituloSessao: String {
        return "Ofertas"
    }
    
    var tipo: ViagemViewModelType {
        return .ofertas
    }
    
    var viagens: [Viagem]
    
    var numeroDeLinhas: Int {
        return 1
    }
    
    //Mark: - Inicializador
    
    init(_ viagens: [Viagem]){
        self.viagens = viagens
    }
    
}
