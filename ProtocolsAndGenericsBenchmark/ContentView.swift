//
//  ContentView.swift
//  ProtocolsAndGenericsBenchmark
//
//  Created by Toomas Vahter on 02.04.2022.
//

import SwiftUI

let processorCount = 1000000

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Protocols", action: computeProtocols)
            Button("Generics", action: computeGenerics)
        }
        .padding()
    }
    
    let coreProtocols: ComputeCoreProtocols = {
        let processors =  [DataProcessor](repeating: DataProcessor(), count: processorCount)
        return ComputeCoreProtocols(dataProcessors: processors)
    }()
    
    func computeProtocols() {
        // Measure with time profiler
        coreProtocols.start()
    }
    
    let coreGenerics: ComputeCoreGenerics<DataProcessor> = {
        let processors = [DataProcessor](repeating: DataProcessor(), count: processorCount)
        return ComputeCoreGenerics(dataProcessors: processors)
    }()
    
    func computeGenerics() {
        // Measure with time profiler
        coreGenerics.start()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
