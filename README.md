# Aman Covid Tracker

<img align="left" src="https://user-images.githubusercontent.com/53443317/178113306-6ca60b84-e277-458f-bde3-2828b10dbf36.png" width="150" height="150">

Aman COVID Tracker is a simple and lightweight app for tracking COVID-19 cases and vaccination progress on iOS and watchOS. Users can select a preferred country or view global data to see detailed information such as new cases, active cases, recent deaths, and vaccination progress, including fully vaccinated and partially vaccinated population number. Additionally, the app provides more information about the specified country, such as life expectancy and population. Users can also access this information through the watchOS app or directly on their home screen via widgets.

## Screenshots

###### iOS

<p float="top">
  <img src="https://user-images.githubusercontent.com/53443317/179368501-dafe2700-966b-41af-a3c7-764113018735.PNG" height="380" />
  <img src="https://user-images.githubusercontent.com/53443317/179385989-340a710d-34d0-4f55-bc1f-b0f990c685e2.gif" height="380" width="200" /> 
  <img src="https://user-images.githubusercontent.com/53443317/179368570-3abff69d-3346-4ee6-ad48-83ce622efd0f.PNG" height="380" />
  
</p>

<p float="top">
  <img src="https://user-images.githubusercontent.com/53443317/179370471-932490ce-9ef5-49ec-8c11-c55d2b5e5285.gif" height="380" width="200" />
  <img src="https://user-images.githubusercontent.com/53443317/179370379-e35f60ce-75aa-43a6-9186-74962f4326b4.gif" height="380" width="180" />
</p>

###### watchOS

<br />

<p float="center">
  <img src="https://user-images.githubusercontent.com/53443317/179369694-437784e3-37a4-43cd-8ac1-a5c399918b09.PNG" height="220" />
  <img src="https://user-images.githubusercontent.com/53443317/179369731-c4ccdf89-4786-4659-83c7-fc6968092d00.PNG" height="220" /> 
  <img src="https://user-images.githubusercontent.com/53443317/179369732-e9b6237e-3289-4138-9ddd-845352cc7256.PNG" height="220" />
  <img src="https://user-images.githubusercontent.com/53443317/179369735-ccee14b2-6274-4d1a-9782-87aeff563845.PNG" height="220" />
</p>


## Features
* Track COVID-19 cases and vaccination progress
* Select and track COVID-19 data by country or globally
* View detailed information including:	new cases, active cases, recent deaths, vaccination progress
* Additional country-specific information (life expectancy, population)
* Access COVID-19 data on your watchOS app
* View COVID-19 information directly on your home screen with widgets

## Technologies Used
Swift, SwiftUI, Combine, WidgetKit, App Groups for shared UserDefaults across different targets

## Minimum Target
* iOS 14.0
* watchOS 7.0

## How to Use
1.	Clone the repository.
2.	Open the project in Xcode.
3.	Set up App Groups:
  *	In Xcode, select your project in the Project Navigator.
  *	Select your app target and go to the Signing & Capabilities tab.
  *	Click the + Capability button and add App Groups.
  *	Create a new App Group (e.g., group.com.yourusername.AmanCovidTracker).
  *	Repeat these steps for the watchOS app target and the Widget target, ensuring they all use the same App Group.
5.	Update the App Group identifier to match the one you created in the setup step.
6.	Build and run the app.

## Known Issues
Since this project is using two different API, some country might have missing data/ unavailable. Most countries (if not all) is no longer updating their COVID-19 cases.

## Credits
API: The Covid-19 case and vaccination data that is used in this app comes from a free API from https://mmediagroup.fr and https://covid-19.dataflowkit.com/.
<br />
Libraries: This app use third party libraries [BottomSheet](https://github.com/lucaszischka/BottomSheet) from Lucas Zischka for the bottom sheet on the HomeView.


## License

MIT License

Copyright 2022 Michael Caesario

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
