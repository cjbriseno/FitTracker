//
//  Bryan's_Stuff.swift
//  FitTracker
//
//  Created by Oscar Hernandez on 12/10/23.
//


import Foundation
import SwiftUI

struct FoodSearch: View {
    @State private var searchQuery = ""
    @State private var foodItems: [FoodItem] = []
    @AppStorage("diary") private var diaryData: Data = Data()
    private var diary: [FoodItem] {
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([FoodItem].self, from: diaryData)
        } catch {
            return []
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                PolygonBackground()
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("Search for Food")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.leading, 20)
                        .padding(.top, 40)
                    
                    TextField("Search for food item", text: $searchQuery)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    Button(action: {
                        searchFoodItems()
                    }) {
                        Text("Search")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .padding()
                    
                    List(foodItems, id: \.self) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text("Calories: \(item.calories)")
                                    .foregroundColor(.gray)
                                Text("Protein: \(item.protein_g)g")
                                    .foregroundColor(.gray)
                                Text("Fats: \(item.fat_total_g)g")
                                    .foregroundColor(.gray)
                                Text("Carbs: \(item.carbohydrates_total_g)g")
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .padding(.vertical, 8)
                            
                            Spacer() // Add Spacer to push the button to the right
                            
                            Button(action: {
                                addToDiary(item)
                            }) {
                                Text("Add")
                                    .foregroundColor(.blue)
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 10)
                                    .background(Color.white)
                                    .cornerRadius(8)
                                    .shadow(radius: 3)
                            }
                        }
                    }
                    .listStyle(InsetListStyle())
                    
                    Divider()
                    
                    Text("Food Diary")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    List {
                        ForEach(diary, id: \.name) { item in
                            HStack {
                                Text(item.name)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                Button(action: {
                                    removeFromDiary(item)
                                }) {
                                    Image(systemName: "minus.circle")
                                        .foregroundColor(.red)
                                }
                            }
                        }
                        .onDelete(perform: deleteDiaryItem)
                    }
                    .listStyle(InsetListStyle())
                }
                .padding(20)
                .navigationBarTitle("", displayMode: .inline)
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
    func addToDiary(_ item: FoodItem) {
        var updatedDiary = diary
        updatedDiary.append(item)
        
        do {
            let encoder = JSONEncoder()
            let encodedData = try encoder.encode(updatedDiary)
            
            // Update the AppStorage
            diaryData = encodedData
        } catch {
            print("Error encoding data: \(error)")
        }
    }
    
    // Function to remove an item from the diary
    func removeFromDiary(_ item: FoodItem) {
        var updatedDiary = diary
        
        if let index = updatedDiary.firstIndex(of: item) {
            updatedDiary.remove(at: index)
            
            do {
                let encoder = JSONEncoder()
                let encodedData = try encoder.encode(updatedDiary)
                
                // Update the AppStorage
                diaryData = encodedData
            } catch {
                print("Error encoding data: \(error)")
            }
        }
    }
    func deleteDiaryItem(at offsets: IndexSet) {
        var updatedDiary = diary
        
        // Remove items at specified offsets
        updatedDiary.remove(atOffsets: offsets)
        
        do {
            let encoder = JSONEncoder()
            let encodedData = try encoder.encode(updatedDiary)
            
            // Update the AppStorage
            diaryData = encodedData
        } catch {
            print("Error encoding data: \(error)")
        }
    }
    func searchFoodItems() {
        let query = searchQuery.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: "https://api.calorieninjas.com/v1/nutrition?query=" + (query ?? ""))!
        var request = URLRequest(url: url)
        request.setValue("wtZEiCiiOriIhEttYylLgA==18UEpZhommGp0ahW", forHTTPHeaderField: "X-Api-Key")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else { return }
            do {
                // Print the raw JSON response
                let jsonString = String(data: data, encoding: .utf8)
                print("JSON Response: \(jsonString ?? "")")
                
                let decoder = JSONDecoder()
                let result = try decoder.decode(SearchResult.self, from: data)
                DispatchQueue.main.async {
                    self.foodItems = result.items
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        task.resume()
    }
}
    

struct FoodDiary_Previews: PreviewProvider {
    static var previews: some View {
        FoodSearch()
    }
}

struct FoodItem: Codable, Hashable {
    var name: String
    var calories: Float
    var serving_size_g: Float
    var fat_total_g: Float
    var fat_saturated_g: Float
    var protein_g: Float
    var sodium_mg: Int
    var potassium_mg: Int
    var cholesterol_mg: Int
    var carbohydrates_total_g: Float
    var fiber_g: Float
    var sugar_g: Float
}

struct SearchResult: Codable {
    var items: [FoodItem]
}
