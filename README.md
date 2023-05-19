# SezilAkdogan_HW2
New York Top Stories 
----------------------
Welcome to News App.

This app is a news application that retrieves news articles from the New York Times API. It allows users to browse news articles by category, view article details, and read the full article in Safari Service.

Project Tech Stack
-------------------
. Language: Swift 

. Xcode Version:

. Deployment Target:

. Minumum iOS Version:

. Design Pattern: MVVM

. Third Party Library: 
     Alamofire (The communication between the Network service and the app was established using Alamofire.), 
     SDWebImage (The issue of overlapping images when scrolling in the TableView has been resolved by installing the SDWebImage library.)
     
.Organized folder structure

.Modularity

.Custom views

.Storyboard Design

.Auto Layout

Screens of the application
----------------------------
First Screen: The user selects a news category from the news categories created using a CollectionView, and the title of the selected news is transferred to the second screen.


Second Screen: The data retrieved from the New York Times API is filtered based on the selected category from the first screen. The filtered news articles are displayed on the screen using a TableView.


Third Screen: This is the screen where the details of the news article, which is clicked from the TableView, are shown.


Fourth Screen: This is the screen where users are taken to the Safari service for the corresponding article when they click on the "See More" button. After reading the article, users can tap on the "Done" button to return to the third screen.

<img src="images/1.png" width="200" height="450"> <img src="images/3.png" width="200" height="450"> <img src="images/4.png" width="200" height="450"> <img src="images/5.png" width="200" height="450"> <img src="images/2.png" width="200" height="450">

Gifs of screens
---------------------------
![1_1](https://github.com/SezilAkdogan/SezilAkdogan_HW2/assets/111681902/34123d3e-e1d3-4f99-bf51-0f620d9111b5)
![2](https://github.com/SezilAkdogan/SezilAkdogan_HW2/assets/111681902/5d4c1e38-f77f-480b-8766-50ec875ffad8)
![3](https://github.com/SezilAkdogan/SezilAkdogan_HW2/assets/111681902/fe643cd7-5610-4a0f-bb78-4121c26a6f08)
