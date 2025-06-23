//
//  ListaProjetosView.swift
//  Crocheteire
//
//  Created by Milena Beicker on 23/06/25.
//

import SwiftUI

struct ListaProjetosView: View {
    @State private var projetos: [Projeto] = []
    @State private var mostrandoNovoProjeto = false
    
    var body: some View {
        NavigationStack {
            List(projetos) { projeto in
                VStack(alignment: .leading) {
                    Text(projeto.nomeProjeto).bold()
                   
                }
            }
            .navigationTitle("Meus Projetos")
            .toolbar {
                Button("Adicionar") {
                    mostrandoNovoProjeto = true
                }
            }
            .sheet(isPresented: $mostrandoNovoProjeto) {
                NovoProjetoView(projetos: $projetos)
            }
        }
    }
}

#Preview {
    ListaProjetosView()
}
