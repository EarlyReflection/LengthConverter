//
//  ContentView.swift
//  LengthConverter
//
//  Created by Vladimir Dvornikov on 25/07/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var inputValue = 1.0
    @State private var inputUnit = "kilometre"
    @State private var outputUnit = "mile"
    
    let units = ["meter", "kilometre", "feet", "yard", "mile"]
    
    var body: some View {
        NavigationStack{
            Form {
                Section {
                    HStack {
                        Text("value:")
                        TextField("enter value", value: $inputValue, format: .number)
                            .multilineTextAlignment(.trailing)
                    }
                    Picker("from", selection: $inputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    Picker("to", selection: $outputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    HStack {
                        Text("result:")
                        Spacer()
                        Text("666")
                    }
                }
            }
            .navigationTitle("Length converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
