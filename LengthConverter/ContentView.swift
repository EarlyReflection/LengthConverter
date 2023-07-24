//
//  ContentView.swift
//  LengthConverter
//
//  Created by Vladimir Dvornikov on 25/07/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var value = 0
    
let lengths = ["meter", "kilometer", "feet", "yard", "mile"]
    

    var body: some View {
        Form {
            Section {
                Picker("Legths", selection: $value) {
                    ForEach(lengths, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
            
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
