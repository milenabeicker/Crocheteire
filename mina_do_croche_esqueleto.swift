// MARK: - Projeto.swift

import Foundation

struct Projeto: Identifiable {
    let id = UUID()
    var nomeProjeto: String
    var descricaoProjeto: String
    var dataCriacao: Date
    var materiaisUsados: [Material]
    var linkReceita: String
}


// MARK: - Material.swift

import Foundation

struct Material: Identifiable {
    let id = UUID()
    var nomeMaterial: String
    var quantidadeEmEstoque: Double
    var unidade: String
    var precoUnitario: Double
}


// MARK: - Contador.swift

import Foundation

struct Contador {
    var pontos: Int = 0
    var carreiras: Int = 0
}


// MARK: - SessaoDeTrabalho.swift

import Foundation

struct SessaoDeTrabalho: Identifiable {
    let id = UUID()
    var projetoId: UUID
    var duracao: TimeInterval
    var data: Date
}


// MARK: - ListaProjetosView.swift

import SwiftUI

struct ListaProjetosView: View {
    var body: some View {
        Text("Lista de Projetos")
    }
}


// MARK: - DetalhesProjetoView.swift

import SwiftUI

struct DetalhesProjetoView: View {
    var projeto: Projeto
    
    var body: some View {
        Text(projeto.nomeProjeto)
    }
}


// MARK: - NovoProjetoView.swift

import SwiftUI

struct NovoProjetoView: View {
    @State private var nomeProjeto = ""
    @State private var descricaoProjeto = ""
    @State private var linkReceita = ""

    var body: some View {
        Form {
            TextField("Nome do Projeto", text: $nomeProjeto)
            TextField("Descrição", text: $descricaoProjeto)
            TextField("Link da Receita", text: $linkReceita)
            Button("Salvar") {
                // lógica para salvar
            }
        }
    }
}


// MARK: - ListaMateriaisView.swift

import SwiftUI

struct ListaMateriaisView: View {
    var body: some View {
        Text("Lista de Materiais")
    }
}


// MARK: - ContadorView.swift

import SwiftUI

struct ContadorView: View {
    @State private var contador = Contador()

    var body: some View {
        VStack(spacing: 16) {
            Text("Pontos: \(contador.pontos)")
            Text("Carreiras: \(contador.carreiras)")
            HStack {
                Button("+1 Ponto") { contador.pontos += 1 }
                Button("-1 Ponto") { contador.pontos -= 1 }
            }
            HStack {
                Button("+1 Carreira") { contador.carreiras += 1 }
                Button("-1 Carreira") { contador.carreiras -= 1 }
            }
        }
    }
}


// MARK: - TemporizadorView.swift

import SwiftUI

struct TemporizadorView: View {
    @State private var tempoDecorrido: TimeInterval = 0
    @State private var estaContando = false
    @State private var timer: Timer?

    var body: some View {
        VStack(spacing: 16) {
            Text("Tempo: \(Int(tempoDecorrido)) segundos")
            Button(estaContando ? "Pausar" : "Iniciar") {
                estaContando.toggle()
                if estaContando {
                    timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                        tempoDecorrido += 1
                    }
                } else {
                    timer?.invalidate()
                }
            }
        }
        .onDisappear {
            timer?.invalidate()
        }
    }
}
