//
//  Projeto.swift
//  Crocheteire
//
//  Created by Milena Beicker on 18/06/25.
//

import SwiftUI
import Foundation


class Projeto: Identifiable {
    var id = UUID()
    var nomeProjeto: String
    var descricaoProjeto: String
    var linkReceita: String
    // var dataCriacao: Date
    // var materiaisUsados: [Material] = []
    
    init(nomeProjeto: String, descricaoProjeto: String, linkReceita: String) {
        self.nomeProjeto = nomeProjeto
        self.descricaoProjeto = descricaoProjeto
        self.linkReceita = linkReceita
    }
}
