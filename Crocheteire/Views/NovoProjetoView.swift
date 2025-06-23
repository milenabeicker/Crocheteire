//
//  NovoProjetoView.swift
//  Crocheteire
//
//  Created by Milena Beicker on 23/06/25.
//

import SwiftUI

struct NovoProjetoView: View {
    
    @State private var nomeProjeto = ""
    @State private var descricaoProjeto = ""
    @State private var linkReceita = "" /// mudar para URL
    @Binding var projetos: [Projeto]
    @Environment(\.dismiss) var dismiss
    //  @State private var materiaisUsados: [Material] = []
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Nome do Projeto", text: $nomeProjeto)
                TextField("Descrição", text: $descricaoProjeto)
                TextField("Link da Receita", text: $linkReceita)
                
                Button("Salvar") {
                    let novoProjeto = Projeto(
                        nomeProjeto: nomeProjeto,
                        descricaoProjeto: descricaoProjeto,
                        linkReceita: linkReceita
                    )
                    projetos.append(novoProjeto)
                        dismiss()
                }
            }
            .navigationTitle("Novo Projeto")
        }
    }
}

#Preview {
    NovoProjetoView(projetos: .constant([]))
}
