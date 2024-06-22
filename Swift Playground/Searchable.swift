//
//  Searchable.swift
//  Swift UI Playground
//
//  Created by Sergio Lira on 6/19/24.
//
// Content: #search #nativation #emptyView #file

import SwiftUI

struct Searchable: View {
    
    @State private var symbols: [String] = []
    @State private var searchTerm  = ""
    
    var filteredSymbols: [String] {
        guard !searchTerm.isEmpty else { return symbols }
        return symbols.filter{ $0.localizedCaseInsensitiveContains(searchTerm) }
    }
    
    var body: some View {
        NavigationStack{
            if symbols.isEmpty {
                ContentUnavailableView(label: {
                    Label("No Symbols", systemImage: "exclamationmark.magnifyingglass")
                }, description: {
                }, actions: {
                    Button(action: {symbols = getAllSymbolNames()}) {
                        Text("Load Symbols")
                    }
                })
            } else {
                VStack{
                    List(filteredSymbols, id: \.self){ symbol in
                        HStack(spacing: 20){
                            Image(systemName:symbol)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 44, height: 44)
                            Text(symbol)
                                .font(.footnote)
                                .fontWeight(.medium)
                        }
                    }.searchable(text: $searchTerm, prompt: "Search Symbols")
                }.navigationTitle("Symbols")
            }
        }
    }
    
    func getAllSymbolNames() -> [String] {
        var symbols: [String] = []
        if let path = Bundle.main.path(forResource: "SFSymbolNames", ofType: "txt") {
            do {
                let data = try String(contentsOfFile: path, encoding: .utf8)
                let myStrings = data.components(separatedBy: .newlines)
                for line in myStrings {
                    symbols.append(line)
//                    if symbols.count > 20{
//                        break
//                    }
                }
            } catch {
                print(error)
            }
        }
        return symbols
    }
}

#Preview {
    Searchable()
}

