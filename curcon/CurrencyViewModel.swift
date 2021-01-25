//
//  ViewModel.swift
//  curcon
//
//  Created by Bahadır Enes Atay on 18.01.2021.
//


struct CurrencyListViewModel {
    let currencyList: [CurrencyModel]

    func numberOfRowsInSection() -> Int {
        return self.currencyList.count
    }

    func businessAtIndex(_ index: Int) -> CurrencyViewModel {
        let currency = self.currencyList[index]
        return CurrencyViewModel(currency: currency)
    }
}

struct CurrencyViewModel {
    let currency: CurrencyModel
    
    var gbp: Double {
        return self.currency.gbp ?? 0.0
    }
    
    var usd: Double {
        return self.currency.usd ?? 0.0
    }
    
    var eur: Double {
        return self.currency.eur ?? 0.0
    }
    
    var tr: Double {
        return self.currency.tr ?? 0.0
    }
    
    var gbpAsBase: Double {
        return gbp/gbp
    }
    
    var usdAsBase: Double {
        return usd/usd
    }
    
    var gbpToTry: Double {
        return tr/gbp
    }
    
    var usdToTry: Double {
        return tr/usd
    }
    
    func currencyViewModel() -> CurrencyViewModel {
        let currency = self.currency
        return CurrencyViewModel(currency: currency)
    }
}


