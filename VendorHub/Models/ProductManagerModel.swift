//
//  ProductModel.swift
//  VendorHub
//
//  Created by Michael Washington on 12/21/23.
//


import Firebase

class ProductManager {
    private let db = Firestore.firestore()

    // Create a new product
    func createProduct(vendorId: String, name: String, description: String, price: Double, stockQuantity: Int, imageUrl: String?, completion: @escaping (Error?) -> Void) {
        let newProduct = db.collection("products").document()
        newProduct.setData([
            "productId": newProduct.documentID,
            "vendorId": vendorId,
            "name": name,
            "description": description,
            "price": price,
            "stockQuantity": stockQuantity,
            "imageUrl": imageUrl ?? ""
        ], completion: completion)
    }

    // Fetch all products for a vendor
    func fetchProducts(vendorId: String, completion: @escaping ([Product]?, Error?) -> Void) {
        db.collection("products").whereField("vendorId", isEqualTo: vendorId).getDocuments { snapshot, error in
            guard let documents = snapshot?.documents else {
                completion(nil, error)
                return
            }
            let products = documents.map { Product(dictionary: $0.data()) }
            completion(products, nil)
        }
    }

    // Update a product
    func updateProduct(productId: String, updatedData: [String: Any], completion: @escaping (Error?) -> Void) {
        db.collection("products").document(productId).updateData(updatedData, completion: completion)
    }

    // Delete a product
    func deleteProduct(productId: String, completion: @escaping (Error?) -> Void) {
        db.collection("products").document(productId).delete(completion: completion)
    }
}

