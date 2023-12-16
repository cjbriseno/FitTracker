//  DiaryPage.swift
//  FitTracker
// Bryan Medina
import Foundation
import SwiftUI

struct FoodDiaryListView: View {
    @AppStorage("diary") private var diaryData: Data = Data()
    @AppStorage("totalCalories") private var totalCalories: Double = 0.0

    private var diary: [FoodItem] {
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([FoodItem].self, from: diaryData)
        } catch {
            return []
        }
    }

    private var calculatedTotalCalories: Double {
        diary.reduce(0.0) { $0 + Double($1.calories) }
    }

    var body: some View {
        NavigationView {
            List(diary, id: \.name) { item in
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
            .listStyle(InsetListStyle())
            .navigationBarTitle("Food Diary", displayMode: .inline)
            .onAppear {
                updateTotalCalories()
            }
        }
    }

    private func updateTotalCalories() {
        print("Total calories are: ", totalCalories)
        totalCalories = calculatedTotalCalories
        
    }
}

struct FoodDiaryListView_Previews: PreviewProvider {
    static var previews: some View {
        FoodDiaryListView()
    }
}
