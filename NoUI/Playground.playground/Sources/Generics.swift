import Foundation

//
//  Generics.swift
//  Swift Playground
//
//  Created by Sergio Lira on 5/26/24.
//

import Foundation

//Example One

func determineHigherValue<T: Comparable>(valueOne: T, valueTwo: T) {
    let higherValue = valueOne > valueTwo ? valueOne : valueTwo
    print("\(higherValue) is the higher value.")
}

//determineHigherValue(valueOne: 3, valueTwo: 8)

// Example Two

let mySedan = Sedan(motor: Motor(), wheels: 4)
let myMoto = Motorcyle(motor: Motor(), wheels: 2)

//driveHome(vehicle: mySedan)
//driveHome(vehicle: myMoto)

func driveHome<T: Drivable>(vehicle: T) {
    // Code to drive the vehible home
}

class Motor {
    var type: String = ""
}

protocol Drivable {
    var motor: Motor { get }
    var wheels: Int { get}
}

struct Sedan: Drivable {
    var motor: Motor
    var wheels: Int
    
    // Code for Sedan
}

struct Motorcyle: Drivable {
    var motor: Motor
    var wheels: Int
    
    // Code specific for motorcycle
}


// Example Three
func fetchData<T: Decodable>(for: T.Type, from url: URL) async throws /*-> T*/{
    let (data, _) = try await URLSession.shared.data(from: url)
    
    do{
        //return try decoder.decode(T.self, from: data)
    } catch {
        throw error
    }
}
