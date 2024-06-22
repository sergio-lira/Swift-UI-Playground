//
//  Searchable.swift
//  Swift UI Playground
//
//  Created by Sergio Lira on 6/19/24.
//
// Content: #search #nativation #emptyView #file
// URL: https://youtu.be/iTqwa0DCIMA?si=fmvFa2FIXMbxdB2T by Sean Allen

import SwiftUI

struct SearchableView: View {
    
    @State private var symbols: [String] = []
    @State private var searchTerm  = ""
    
    var filteredSymbols: [String] {
        guard !searchTerm.isEmpty else { return symbols }
        return symbols.filter{ $0.localizedCaseInsensitiveContains(searchTerm) }
    }
    
    var body: some View {
        if symbols.isEmpty {
            ContentUnavailableView(label: {
                Label("", systemImage: "square.and.arrow.down")
            }, description: {
            }, actions: {
                Button(action: {symbols = getAllSymbolNames()}) {
                    Text("Load Symbols")
                }
            })
        } else {
            NavigationStack {
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
                }.navigationTitle("SF Symbols")
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
                    //                    if symbols.count > 200{
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
    SearchableView()
}

