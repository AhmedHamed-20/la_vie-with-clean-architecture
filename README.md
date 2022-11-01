# la_vie_with_clean_architecture

it's the same app that I made in the orange digital center hackathon but refactored with clean architecture.

## Getting Started
it's an e-commerce app to view and buy plants
## Features
- Able to view plants and buy it.
- Blogs feature that makes you know more information about each plant.
- Scan any plant QR code and buy it.
- Community feature that you can share your feedback about plants and see other people's feedback and react to it.
- Edit your profile info like (name-email)
- Dark and light theme mode

## Technical Features
- Bloc as state management
- Dependency injection using (getIt)
- Qr code Scanner
- Clean Architecture

## Project Structure
📦core
 ┣ 📂cache
 ┣ 📂components 
 ┣ 📂constants
 ┣ 📂database
 ┣ 📂error
 ┣ 📂layout
 ┃ ┗ 📂features
 ┃ ┃ ┗ 📂main_layout
 ┃ ┃ ┃ ┣ 📂data
 ┃ ┃ ┃ ┃ ┣ 📂datasources
 ┃ ┃ ┃ ┃ ┣ 📂models
 ┃ ┃ ┃ ┃ ┗ 📂repositories
 ┃ ┃ ┃ ┣ 📂domain
 ┃ ┃ ┃ ┃ ┣ 📂entities
 ┃ ┃ ┃ ┃ ┣ 📂repositories
 ┃ ┃ ┃ ┃ ┗ 📂usecases
 ┃ ┃ ┃ ┗ 📂presentation
 ┃ ┃ ┃ ┃ ┣ 📂bloc
 ┃ ┃ ┃ ┃ ┣ 📂screens
 ┃ ┃ ┃ ┃ ┗ 📂widgets
 ┣ 📂network
 ┣ 📂network_connection
 ┣ 📂params
 ┣ 📂qr_code_scanner
 ┣ 📂routes
 ┣ 📂services
 ┣ 📂splash_screen
 ┣ 📂text_fileds_controlers
 ┣ 📂theme
 ┣ 📂theme_mode_feature
 ┃ ┣ 📂data
 ┃ ┃ ┣ 📂datasources
 ┃ ┃ ┣ 📂models
 ┃ ┃ ┗ 📂repositories
 ┃ ┣ 📂domain
 ┃ ┃ ┣ 📂entities
 ┃ ┃ ┣ 📂repositories
 ┃ ┃ ┗ 📂usecases
 ┃ ┗ 📂presentation
 ┃   ┗ 📂bloc
 ┣ 📂usecases
 ┣ 📂utl
 ┗ 📂widgets
 ┃ ┣ 📂details_screen_widgets
 ┃ 
 ┗📦Features
   ┃ 
   ┣ 📂Auth
   ┣ 📂Blogs
   ┣ 📂Products
   ┣ 📂Scan
   ┣ 📂Forums
   ┣ 📂Edit user info

## Screenshots
 