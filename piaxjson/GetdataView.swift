//
//  GetdataView.swift
//  piaxjson
//
//  Created by Bill Martensson on 2021-12-02.
//

import SwiftUI

struct GetdataView: View {
    
    @State var animalname = ""
    
    var body: some View {
        VStack {
            Text(animalname)
        }.onAppear(perform: {
            getDataFromUrl()
        })
    }
    
    
    func getDataFromUrl()
    {
        let urlString = "https://cat-fact.herokuapp.com/facts"

        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                // we're OK to parse!
                let decoder = JSONDecoder()
                do {
                    let funanimal = try decoder.decode([Catfact].self, from: data)

                    print(funanimal[0].text)
                    print(funanimal[1].text)

                } catch {
                    print("Det gick inte!!")
                }
                
            }
        }
    }
    
}

struct GetdataView_Previews: PreviewProvider {
    static var previews: some View {
        GetdataView()
    }
}


struct Catfact : Codable {
    var text : String
    var createdAt : String
}
