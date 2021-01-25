//
//  Model.swift
//  curcon
//
//  Created by Bahadır Enes Atay on 16.01.2021.
//

import Foundation

struct CurrencyModel: Codable {
    var gbp: Double?
    var usd: Double?
    var eur: Double?
    var tr: Double?
    
    init(gbp: Double, usd: Double, eur: Double, tr: Double) {
        self.gbp = gbp
        self.usd = usd
        self.eur = eur
        self.tr = tr
    }
}
