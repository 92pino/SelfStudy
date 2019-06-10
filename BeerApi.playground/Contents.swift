import UIKit

struct FirstDepth: Codable {
    
    let id: Int
    let name: String
    let foodParing: [String]
    
    let method: SecondDepth
    
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case method
        case foodParing = "food_pairing"
    }
}

struct SecondDepth: Codable {
    let mashTemp: [NextDepth]
    
    enum CodingKeys: String, CodingKey {
        case mashTemp = "mash_temp"
    }
    
    
}

struct NextDepth: Codable {
    let temp: value
    
    
}
struct value: Codable {
    let value: Int
}
    
    let urlString = "https://api.punkapi.com/v2/beers/1"
    let url = URL(string: urlString)!
    
    URLSession.shared.dataTask(with: url) { (data, response, error) in
        
        guard error == nil else { return print(error!) }
        guard let response = response as? HTTPURLResponse,
            200..<400 ~= response.statusCode
            else { return print("StatusCode is not valid")}
        if let beer = try? JSONDecoder().decode([FirstDepth].self, from: data!) {
            beer.forEach { print($0) }
        }
    }.resume()
