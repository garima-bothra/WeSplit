//
//  ContentView.swift
//  WeSplit
//
//  Created by Garima Bothra on 09/06/20.
//  Copyright © 2020 Garima Bothra. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var checkAmount = ""
    @State var numberOfPeople = 2
    @State var tipPercentage = 2

    let tipPercentages = [5, 10, 15, 20, 0]

    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let billValue = Double(checkAmount) ?? 0
        let total = billValue + billValue * Double(tipSelection / 100)
        return total / peopleCount
    }

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    Picker("Number of people", selection: $numberOfPeople){
                        ForEach(2 ..< 100){
                            Text("\($0) people")
                        }
                    }
                }

                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentage){
                        ForEach( 0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Amount per person:")) {
                Text("Amount: $\(totalPerPerson, specifier: "%.2F")")
                }
            }
        .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
