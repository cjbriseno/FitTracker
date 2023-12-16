//
//  FoodSearchTests.swift
//  FitTrackerTests
//
//  Created by The FitTracker Team
//

import XCTest

final class FoodSearchTests: XCTestCase {

    func testAddToDiary() {
        // Given
        var foodSearch = FoodSearch()
        let testItem = FoodItem(name: "Test Food", calories: 150.0, serving_size_g: 100.0, fat_total_g: 5.0, fat_saturated_g: 2.0, protein_g: 10.0, sodium_mg: 200, potassium_mg: 300, cholesterol_mg: 15, carbohydrates_total_g: 20.0, fiber_g: 3.0, sugar_g: 5.0)

        // When
        foodSearch.addToDiary(testItem)

        // Then
        XCTAssertTrue(foodSearch.diary.contains(testItem))
    }

    func testRemoveFromDiary() {
        // Given
        var foodSearch = FoodSearch()
        let testItem = FoodItem(name: "Test Food", calories: 150.0, serving_size_g: 100.0, fat_total_g: 5.0, fat_saturated_g: 2.0, protein_g: 10.0, sodium_mg: 200, potassium_mg: 300, cholesterol_mg: 15, carbohydrates_total_g: 20.0, fiber_g: 3.0, sugar_g: 5.0)
        foodSearch.addToDiary(testItem)

        // When
        foodSearch.removeFromDiary(testItem)

        // Then
        XCTAssertFalse(foodSearch.diary.contains(testItem))
    }

    func testDeleteDiaryItem() {
        // Given
        var foodSearch = FoodSearch()
        let testItem = FoodItem(name: "Test Food", calories: 150.0, serving_size_g: 100.0, fat_total_g: 5.0, fat_saturated_g: 2.0, protein_g: 10.0, sodium_mg: 200, potassium_mg: 300, cholesterol_mg: 15, carbohydrates_total_g: 20.0, fiber_g: 3.0, sugar_g: 5.0)
        foodSearch.addToDiary(testItem)

        // When
        foodSearch.deleteDiaryItem(at: IndexSet([0]))

        // Then
        XCTAssertFalse(foodSearch.diary.contains(testItem))
    }

    func testSearchFoodItems() {
        // Given
        let foodSearch = FoodSearch()
        let expectation = XCTestExpectation(description: "Search Food Items")

        // When
        foodSearch.searchQuery = "apple"
        foodSearch.searchFoodItems()

        // Then
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            XCTAssertFalse(foodSearch.foodItems.isEmpty)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5.0)
    }
}
