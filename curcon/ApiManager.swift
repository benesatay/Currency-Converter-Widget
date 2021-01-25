//
//  ApiManager.swift
//  curcon
//
//  Created by Bahadır Enes Atay on 16.01.2021.
//

import Foundation

class ApiManager {
    let baseUrl = "http://data.fixer.io/api/"
    let urlString = "latest?access_key=c4b7d92746b9a477437151987546bb88&symbols=GBP,EUR,USD,TRY&format=1"

    func setSession(onSuccess: @escaping([String:Any]) -> Void, onError: @escaping(Error) -> Void) {
        let fullUrlString: String = baseUrl + urlString
        let url = URL(string: fullUrlString)
        let session = URLSession.shared
        let task = session.dataTask(with: url!) { (data, response, error) in
            guard data != nil,
                  error == nil else { return onError(error!) }
            do {
                let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                onSuccess(jsonResponse)
            } catch {
                print("error")
            }
        }
        task.resume()
    }
    
    func getCurrencyData(onSuccess: @escaping(CurrencyViewModel) -> Void, onError: @escaping(Error) -> Void) {
        fillCurrencyModel { (currencyModel) in
            let currencyViewModel = CurrencyViewModel(currency: currencyModel)
            onSuccess(currencyViewModel)
        } onError: { (error) in
            onError(error)
        }
    }
    
    func fillCurrencyModel(onSuccess: @escaping(CurrencyModel) -> Void, onError: @escaping(Error) -> Void) {
        setSession { (jsonResponse) in
            DispatchQueue.main.async {
                if let rates = jsonResponse["rates"] as? [String: Any] {
                    if let gbp = rates["GBP"] as? Double,
                       let usd = rates["USD"] as? Double,
                       let eur = rates["EUR"] as? Double,
                       let tr = rates["TRY"] as? Double {
                        let currencyModel = CurrencyModel(
                            gbp: gbp,
                            usd: usd,
                            eur: eur,
                            tr: tr
                        )
                        onSuccess(currencyModel)
                    }
                }
            }
        } onError: { (error) in
            onError(error)
        }
    }

}
