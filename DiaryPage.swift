//
//  DiaryPage.swift
//  FitTracker
//
//  Created by Oscar Hernandez on 12/15/23.
//

import Foundation

// Import necessary SwiftUI views
import SwiftUI

struct FoodDiaryListView: View {
    @AppStorage("diary") private var diaryData: Data = Data()
    @Binding var totalCalories: Double
    @State private var diary: [FoodItem] = []
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Total Calories: \(totalCalories)")
                    .font(.headline)
                    .foregroundColor(.orange)
                    .padding()
                
                List {
                    ForEach(diary, id: \.name) { item in
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
                    }
                    .onDelete(perform: deleteItem)
                }
                .listStyle(InsetListStyle())
                .navigationBarTitle("Food Diary", displayMode: .inline)
                .onAppear {
                    loadDiary()
                    updateTotalCalories()
                }
            }
        }
    }

    private func loadDiary() {
        do {
            let decoder = JSONDecoder()
            diary = try decoder.decode([FoodItem].self, from: diaryData)
        } catch {
            diary = []
        }
    }

    private func deleteItem(at offsets: IndexSet) {
        diary.remove(atOffsets: offsets)
        saveDiary()
        updateTotalCalories()
    }

    private func saveDiary() {
        do {
            let encoder = JSONEncoder()
            diaryData = try encoder.encode(diary)
        } catch {
            print("Error saving diary data: \(error.localizedDescription)")
        }
    }

    private func updateTotalCalories() {
        totalCalories = diary.reduce(0.0) { $0 + Double($1.calories) }
    }
}

struct FoodDiaryListView_Previews: PreviewProvider {
    static var previews: some View {
        FoodDiaryListView(totalCalories: .constant(0.0))
    }
}
