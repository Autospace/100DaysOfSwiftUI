//
//  ContentView.swift
//  LengthConverter
//
//  Created by Alex Mostovnikov on 28/9/22.
//

import SwiftUI

struct ContentView: View {
    @State private var input: Double = 0.0
    @State private var inputUnit: UnitLength = .meters
    @State private var outputUnit: UnitLength = .meters

    private let units: [UnitLength] = [.meters, .centimeters, .decameters, .feet, .astronomicalUnits]

    private var output: Double {
        get {
            let inputValue = Measurement(value: input, unit: inputUnit)
            return inputValue.converted(to: outputUnit).value
        }
    }

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter your value", value: $input, format: .number)
                        .keyboardType(.numberPad)
                } header: {
                    Text("Input")
                }
                Section {
                    Picker("Input unit", selection: $inputUnit) {
                        ForEach(units, id: \.self) {
                            Text("\(getName(for: $0))")
                        }
                    }
                }

                Section {
                    Picker("Output unit", selection: $outputUnit) {
                        ForEach(units, id: \.self) {
                            Text("\(getName(for: $0))")
                        }
                    }
                }
                Section{
                    Text("\(output.formatted())")
                } header: {
                    Text("Output")
                }
            }
            .navigationTitle("Length Converter")
        }
    }

    private func getName(for unit: UnitLength) -> String {
        var returnValue = ""

        switch unit {
        case .meters:
            returnValue = "Meters"
        case .centimeters:
            returnValue = "Centimeters"
        case .decimeters:
            returnValue = "Decimeters"
        case .feet:
            returnValue = "Feet"
        case .astronomicalUnits:
            returnValue = "Astronomical units"
        default:
            returnValue = "Unknown"
        }

        return returnValue
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
