# Aleph iOS Technical Test App

## Introduction
This iOS app fetches and displays data from a complex JSON structure, showcasing skills in data handling, UI design, and navigation. The app demonstrates robust data fetching, parsing, and user interaction through a clean and intuitive interface.

## Features
- **Data Fetching**: Retrieves data from a provided JSON structure via an API.
- **Category List**: Displays a list of categories with item counts.
- **Item List**: Shows items within each category with title, description, and thumbnail.
- **Detailed View**: Provides comprehensive details for each item.
- **Navigation**: Smooth navigation between categories, items, and detailed views.
- **Bonus Features**:
  - Pull-to-refresh functionality.
  - Search functionality to filter items by title or tags.
  - Loading indicators during data fetching.

## Installation Instructions
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/dinda-ayu-syafitri/AlephTechnicalTest.git
   ```
2. **Open the Project**:
   - Open `AlephTechnicalTest.xcodeproj` in Xcode.
3. **Run the App**:
   - Select a simulator or device and click the `Run` button in Xcode.

## App Structure
### Page 1: Home Page - Categories
- Displays a list of categories.
- Each category shows its name.
- Tapping a category navigates to the items list for that category.

### Page 2: Category Items Page
- Lists items for the selected category.
- Each item displays a title, description, and thumbnail image.
- Tapping an item navigates to the detailed view.

### Page 3: Item Detail Page
- Shows detailed information for the selected item.
- Includes the title, full description, image, author, published date, and tags.

## Tech Stack
- **SwiftUI**: For building the user interface.
- **NavigationView**: For navigation between views.
- **URLSession**: For data fetching.
- **Codable**: For JSON parsing.


