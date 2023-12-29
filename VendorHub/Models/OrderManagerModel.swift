//
//  OrderManager.swift
//  VendorHub
//
//  Created by Michael Washington on 12/21/23.
//

import Firebase

class OrderManager {
    private let db = Firestore.firestore()

    // Create a new order
    func createOrder(vendorId: String, productId: String, quantity: Int, customerDetails: [String: String], completion: @escaping (Error?) -> Void) {
        let newOrder = db.collection("orders").document()
        newOrder.setData([
            "orderId": newOrder.documentID,
            "vendorId": vendorId,
            "productId": productId,
            "quantity": quantity,
            "orderStatus": "pending",
            "orderDate": Timestamp(date: Date()),
            "customerDetails": customerDetails
        ], completion: completion)
    }

    // Fetch orders for a vendor
    func fetchOrders(vendorId: String, completion: @escaping ([Order]?, Error?) -> Void) {
        db.collection("orders").whereField("vendorId", isEqualTo: vendorId).getDocuments { snapshot, error in
            guard let documents = snapshot?.documents else {
                completion(nil, error)
                return
            }
            let orders = documents.map { Order(dictionary: $0.data()) }
            completion(orders, nil)
        }
    }

    // Update an order's status
    func updateOrderStatus(orderId: String, newStatus: String, completion: @escaping (Error?) -> Void) {
        db.collection("orders").document(orderId).updateData(["orderStatus": newStatus], completion: completion)
    }

    // Delete an order
    func deleteOrder(orderId: String, completion: @escaping (Error?) -> Void) {
        db.collection("orders").document(orderId).delete(completion: completion)
    }
}

