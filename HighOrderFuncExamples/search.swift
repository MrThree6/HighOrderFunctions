//
//  ContentView.swift
//  HighOrderFuncExamples
//
//  Created by Nosaibah Alrajhi on 18/11/2023.
//

import SwiftUI




struct search: View {
    let names = ["ahmed", "mohammad", "albaraa", "abdullah", "khliad"]
      @State private var textsearch = ""

      var body: some View {
          
          ZStack {
              
              NavigationStack {
                  List {
                      ForEach(searchResults, id: \.self) { name in
                              Text(name)
                      }
                  }
                  .navigationTitle("Contacts")
                  
                  
              }
              .searchable(text: $textsearch)
          }
          
      }

      var searchResults: [String] {
          if textsearch.isEmpty {
              return names
          } else {
              return names.filter { i in
                  i.localizedCaseInsensitiveContains(textsearch) }
          }
      }
  }

#Preview {
    search()
}
