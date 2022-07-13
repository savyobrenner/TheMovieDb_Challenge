# VeryCreatives_Challenge

An iOS app challenge using TheMovieDB developer API.

## Installation
1. Run ``` pod install ```.
2. Open .xcworkspace file.
3. Run.

##### If "No Scheme" appears on the first load, follow these steps:
4. Select the "No Scheme".
5. Go to the "New Scheme" option.
6. Check if the suggested target is "VeryCreatives"
7. Confirm.
8. Run.

## Features
1. Popular Movies List Feature.

2. TopRated Movies List Feature.

3. Movies Details Feature (including movies trailer and ways to watch).

4. Save Movies to the favorite list using UserDefaults.

5. Prioritize favorites screen in offline use.

6. Support for three languages (Portuguese, English, and Spanish).

## App Architecture

* Built using VIPER architecture, modularized in Model, Network, Resources and Sources.
* Unit testing was made with XCTest, Apple's native framework.

## Compatibility

* iPhone and iPad on portrait orientation.

## Third-party Dependencies

* Alamofire - Used for API calls.
* Kingfisher - Used to download and treat movie posters.
* Youtube iOS Player Helper - Used to show the movie trailer in the app.

## Screenshots
| Splash Screen    | Home Screen       | Details Screen      | Favorites Screen   | 
|:----------------:|:-----------------:|:-------------------:|:------------------:|
|![splash-screen][]| ![home-screen][]  | ![details-screen][] |![favorites-screen][]|

[splash-screen]: https://github.com/savyobrenner/TheMovieDb_Challenge/blob/main/sources/IMG_6582.PNG?raw=true
[home-screen]: https://github.com/savyobrenner/TheMovieDb_Challenge/blob/main/sources/IMG_6583.PNG?raw=true
[details-screen]: https://github.com/savyobrenner/TheMovieDb_Challenge/blob/main/sources/IMG_6586.PNG?raw=true
[favorites-screen]: https://github.com/savyobrenner/TheMovieDb_Challenge/blob/main/sources/IMG_6585.PNG?raw=true
