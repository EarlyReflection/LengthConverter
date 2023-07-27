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
    @FocusState private var amountIsFocused: Bool
    
    let units = ["metre", "kilometre", "inch", "feet", "yard", "mile"]
    
    var inValueToMetre: Double {
        let unitToMetre: Double
        
        switch inputUnit {
        case "kilometre":
            unitToMetre = 1000
        case "inch":
            unitToMetre = 0.0254
        case "feet":
            unitToMetre = 0.3048
        case "yard":
            unitToMetre = 0.9144
        case "mile":
            unitToMetre = 1609.34
        default:
            unitToMetre = 1
        }
        
        return unitToMetre * inputValue
    }
    
    var result: Double {
        let metreToUnit: Double
        
        switch outputUnit {
        case "kilometre":
            metreToUnit = 0.001
        case "inch":
            metreToUnit = 39.3701
        case "feet":
            metreToUnit = 3.28084
        case "yard":
            metreToUnit = 1.09361
        case "mile":
            metreToUnit = 0.000621371
        default:
            metreToUnit = 1
        }
        
        return inValueToMetre * metreToUnit
    }
    
    var body: some View {
        NavigationStack{
            Form {
                Section {
                    HStack {
                        Text("value:")
                        TextField("enter value", value: $inputValue, format: .number)
                            .multilineTextAlignment(.trailing)
                    }
                    .keyboardType(.decimalPad)
                    .focused($amountIsFocused)
                    
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
                        Text(String(result))
                    }
                }
            }
            .navigationTitle("Length converter")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
