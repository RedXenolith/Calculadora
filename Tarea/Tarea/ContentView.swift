//
//  ContentView.swift
//  Tarea
//
//  Created by Diego Guzmán on 6/03/23.
//

import SwiftUI

struct ContentView: View {
  enum Operation {
    case add, subtract, multiply, divide
  }
  
  @State var num1 = ""
  @State var num2 = ""
  @State var operation = Operation.add
  
    var result: Double {
        let n1 = Double(num1) ?? 0
        let n2 = Double(num2) ?? 0
        switch operation {
        case .add:
            return n1 + n2
        case .subtract:
            return n1 - n2
        case .multiply:
            return n1 * n2
        case .divide:
            if n2 == 0 {
                print("Es imposible multiplicar por cero")
                return 0
            } else {
                return n1 / n2
            }
        }
    }

var body: some View {
  VStack {
    TextField("Número 1", text: $num1)
      .keyboardType(.numberPad)
      .padding()
    TextField("Número 2", text: $num2)
      .keyboardType(.numberPad)
      .padding()
    HStack {
      Button(action: { self.operation = .add }, label: {
          Image(systemName: "plus.square")
      })
      Button(action: { self.operation = .subtract }, label: {
          Image(systemName: "minus.square")
      })
      Button(action: { self.operation = .multiply }, label: {
          Image(systemName: "multiply.square")
      })
      Button(action: { self.operation = .divide }, label: {
          Image(systemName: "divide.square")
      })
    }
    .padding()
    Text("\(result)")
      .font(.largeTitle)
      .padding()
  }
}
}

struct ContentView_Previews: PreviewProvider {
static var previews: some View {
  ContentView()
}
}


