# Aman Covid Tracker

<img align="left" src="https://user-images.githubusercontent.com/53443317/178113306-6ca60b84-e277-458f-bde3-2828b10dbf36.png" width="180" height="180">
Aman Covid Tracker is a simple and lightweight Covid-19 case tracking app for iOS and watchOS.
<br />
<br />
As someone who always gets anxious since the early stages of the pandemic, I thought it'd be great if I could just glance at the most important information about COVID-19 cases on my phone homescreen and my watch, so I decided to build myself a COVID-19 tracking app. This little project was a really fun project for me to explore more about Combine and iOS development. I am the sole developer and asset designer for this project.

<br />
<br />
<br />

## Screenshots

###### iOS

<p float="top">
  <img src="https://user-images.githubusercontent.com/53443317/179368501-dafe2700-966b-41af-a3c7-764113018735.PNG" height="380" />
  <img src="https://user-images.githubusercontent.com/53443317/179385989-340a710d-34d0-4f55-bc1f-b0f990c685e2.gif" height="380" /> 
  <img src="https://user-images.githubusercontent.com/53443317/179368570-3abff69d-3346-4ee6-ad48-83ce622efd0f.PNG" height="380" />
  
</p>

<p float="top">
  <img src="https://user-images.githubusercontent.com/53443317/179370471-932490ce-9ef5-49ec-8c11-c55d2b5e5285.gif" height="380" />
  <img src="https://user-images.githubusercontent.com/53443317/179370379-e35f60ce-75aa-43a6-9186-74962f4326b4.gif" height="380" />
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
* Track Covid-19 cases and vaccination progress
* Easily access Covid-19 case information at your Homescreen with Widgets
* Choose and track Covid-19 case by Country
* Available on watchOS
* Available in Light and Dark Mode

## What I Learned
* API call with Combine
* Reusable Views
* Working with WidgetKit and watchOS
* AppStorage/ UserDefaults and App Groups
* Swift Package Manager
* Design and built app icon from scratch with Figma

## Frameworks
SwiftUI, Combine, WidgetKit

## Minimum Target
* iOS 14.0
* watchOS 7.0

## How to Use
Clone and run this project in Xcode

## Known Issues
Since this project is using two different API, some country might have missing data/ unavailable.

## Credits
API: The Covid-19 case and vaccination data that is used in this app comes from a free API from https://mmediagroup.fr and https://covid-19.dataflowkit.com/.
<br />
Libraries: This app use third party libraries [BottomSheet](https://github.com/lucaszischka/BottomSheet) from Lucas Zischka for the bottom sheet on the main view.


## License

MIT License

Copyright 2022 Michael Caesario

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
