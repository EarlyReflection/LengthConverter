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
    
    var inputInFeet: Double {
        switch inputUnit {
        case "meter":
            return  3.281 * inputValue
        case "kilometre":
            return 3281 * inputValue
        case "yard":
            return 3 * inputValue
        case "mile":
            return 5280 * inputValue
        default:
            return inputValue
        }
    }
    
    var result: Double {
        switch outputUnit {
        case "meter":
            return inputInFeet / 3.281
        case "kilometre":
            return inputInFeet / 3281
        case "yard":
            return inputInFeet / 3
        case "mile":
            return inputInFeet / 5280
        default:
            return inputInFeet
        }
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
                        Text("\(result)")
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
