//
//  SalesModel.swift
//  VendorHub
//
//  Created by Michael Washington on 12/21/23.
//

import Firebase

class SalesAnalyticsManager {
    private let db = Firestore.firestore()

    // Calculate total sales for a vendor
    func calculateTotalSales(vendorId: String, completion: @escaping (Double?, Error?) -> Void) {
        db.collection("orders").whereField("vendorId", isEqualTo: vendorId).getDocuments { snapshot, error in
            guard let documents = snapshot?.documents else {
                completion(nil, error)
                return
            }
            let totalSales = documents.compactMap { Order(dictionary: $0.data()) }.reduce(0) { sum, order in
                sum + (order.price * Double(order.quantity))
            }
            completion(totalSales, nil)
        }
    }

    // Additional methods for monthly sales, top products, etc., can be added here.
}
