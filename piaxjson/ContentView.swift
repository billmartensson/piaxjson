//
//  ContentView.swift
//  piaxjson
//
//  Created by Bill Martensson on 2021-12-02.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
        }.onAppear(perform: {
            dostuff()
        })
    }
    
    
    
    func dostuff()
    {
        let json = """
        {
            "name": "Durian",
            "points": 600,
            "xxxxxxxx": "A fruit with a distinctive scent."
        }
        """.data(using: .utf8)!

        
        let sometext = """
        {
            "fruitname": "Banan",
            "fruitcolor": "Yellow",
            "price": 7
        }
        """
        
        let somedata = sometext.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        do {
            let product = try decoder.decode(Fruit.self, from: somedata)

            print(product.fruitname) // Prints "Durian"
            print(product.fruitcolor)
            print(product.price)
        } catch {
            print("Det gick inte!!")
        }
        
        
        if let filepath = Bundle.main.path(forResource: "alltheinfo", ofType: "json") {
            do {
                let thegettingstring = try String(contentsOfFile: filepath)
                
                let thedata = thegettingstring.data(using: .utf8)!
                
                let decoder = JSONDecoder()
                do {
                    let funanimal = try decoder.decode(Animal.self, from: thedata)

                    print(funanimal.name)
                    print(funanimal.animaltype)
                    
                } catch {
                    print("Det gick inte!!")
                }
                
            } catch {
                // contents could not be loaded
            }
        } else {
            // example.txt not found!
        }
        
        
        
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct GroceryProduct: Codable {
    var name: String
    var points: Int
    var description: String?
}

struct Fruit : Codable {
    var fruitname : String
    var fruitcolor : String
    var price : Int
}

struct Animal : Codable {
    var name : String
    var animaltype : String
    var age : Int
}
