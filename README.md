Gifshow
======================================
Endless grid with trending gifs using Giphy API

## Architecture
I tried to not follow any specific architecture, I adapted the __MVVM__ architecture to the project needs, using also: Builders, Interactors.

## To run 
- clone the repo and install the pods

## Used libs
- __Gifu__: Used for gif rendering and animations inside the CollectionView and ViewController.
- __RxSwift/RxCocoa__: To manage and enable easy composition of asynchronous operations and event/data streams.
- __AlamoFire__: HTTP networking
- __SwiftyJSON__: To deal with JSON data

## TODO:
- [ ] Implement a better error handling
- [ ] Use Apple's prefetch API for a even better performance
- [ ] Add support to offline (Using repos)

## Known bug:
- [ ] Jumpy scroll when scrolling fast
