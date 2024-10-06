# la_vie_with_clean_architecture

it's the same app that I made in the orange digital center hackathon but refactored with clean architecture.

## Getting Started
![logo](https://user-images.githubusercontent.com/72945669/199287410-a090d76b-2a36-42b6-abf6-b449abec51a7.png)
it's an e-commerce app to view and buy plants
## Features
- Able to view plants and buy them.
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
```
📦core
 ┣ 📂cache
 ┣ 📂components 
 ┣ 📂constants
 ┣ 📂database
 ┣ 📂error
 ┣ 📂layout
 ┃ ┗ 📂features
 ┃   ┗ 📂main_layout
 ┃     ┣ 📂data
 ┃     ┃ ┣ 📂datasources
 ┃     ┃ ┣ 📂models
 ┃     ┃ ┗ 📂repositories
 ┃     ┣ 📂domain
 ┃     ┃ ┣ 📂entities
 ┃     ┃ ┣ 📂repositories
 ┃     ┃ ┗ 📂usecases
 ┃     ┗ 📂presentation
 ┃       ┣ 📂bloc
 ┃       ┣ 📂screens
 ┃       ┗ 📂widgets
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
 ┃ ┗ 📂details_screen_widgets
 ┃ 
 ┗📦Features
   ┃ 
   ┣ 📂Auth
   ┣ 📂Blogs
   ┣ 📂Products
   ┣ 📂Scan
   ┣ 📂Forums
   ┣ 📂Edit user info
```

## Screenshots
<img src="https://user-images.githubusercontent.com/72945669/199288860-b043230c-7cf1-4c27-8ed5-cf01a2d8f64b.png" width="280"> <img src="https://user-images.githubusercontent.com/72945669/199289057-1e508bb0-939f-4ce9-8059-548242884080.png" width="280"> <img src="https://user-images.githubusercontent.com/72945669/199289072-0dfabfd3-e0a2-4ac1-bb3d-68aa69a5a05d.png" width="280"> <img src="https://user-images.githubusercontent.com/72945669/199289083-7089cda1-2577-4ddf-9862-a55b4bebb59d.png " width="280"> <img src="https://user-images.githubusercontent.com/72945669/199289095-18402b0b-c50f-4469-a006-829dfb63f816.png" width="280"> <img src="https://user-images.githubusercontent.com/72945669/199289150-375fc675-f586-41e3-b21c-437c6f4f1987.png" width="280"> <img src="https://user-images.githubusercontent.com/72945669/199289153-e4617e59-393c-44c9-8744-9882eade494a.png" width="280"> <img src="https://user-images.githubusercontent.com/72945669/199289200-834e5fad-43c9-4565-9429-8b6e2bb3eb6f.png" width="280"> <img src="https://user-images.githubusercontent.com/72945669/199289226-2ca0afb1-8382-4473-a6c7-7980fb396a80.png" width="280"> <img src="https://user-images.githubusercontent.com/72945669/199289281-31038135-eddb-47e9-a809-21bc7adf90a4.png" width="280"> <img src="https://user-images.githubusercontent.com/72945669/199289292-dfaf4161-df0b-439e-b2e1-4c8caa49dbf1.png" width="280"> <img src="https://user-images.githubusercontent.com/72945669/199289302-ff44d54b-6a4f-4e2f-a03d-adf95820132e.png" width="280"> <img src="https://user-images.githubusercontent.com/72945669/199289307-c9569606-70ed-4c3d-b1dc-9d2e5c3b601e.png" width="280"> <img src="https://user-images.githubusercontent.com/72945669/199289324-b5fa7898-1029-4f5e-b63c-90dce5d5a213.png" width="280"> <img src="https://user-images.githubusercontent.com/72945669/199288997-2c950e66-be44-443d-970e-335c51342b5a.png" width="280"> <img src="https://user-images.githubusercontent.com/72945669/199289002-e12b6481-c4a3-4f80-b093-5936ad5774f5.png" width="280"> <img src="https://user-images.githubusercontent.com/72945669/199289008-810e3a6c-57d3-44ca-a091-b7ed580638c1.png" width="280"> <img src="https://user-images.githubusercontent.com/72945669/199289013-33a17d07-1fdf-4f52-b51f-d676b21f072d.png" width="280">



