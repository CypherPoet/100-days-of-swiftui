# Day 96: _Project 19: SnowSeeker_ (Part One)

_Follow along at https://www.hackingwithswift.com/100/swiftui/96_.

<br/>


# 📒 Field Notes

This day covers Part One of _`Project 19`_ in the [100 Days of SwiftUI Challenge](https://www.hackingwithswift.com/100/swiftui/96).

It focuses on several specific topics:

- SnowSeeker: Introduction
- Working with two side by side views in SwiftUI
- Using alert() and sheet() with optionals
- Using groups as transparent layout containers




## SnowSeeker: Introduction

From the project description:

> In this project we’re going to create SnowSeeker: an app to let users browse ski resorts around the world.
>
> ...
>
> This will be the first app where we specifically aim to make something that works great on iPad by showing two views side by side, but you’ll also get deep into solving problematic layouts, learn a new way to show sheets and alerts, and more.



## Working with two side by side views in SwiftUI


SwiftUI doesn't have a direct equivalent of UIKit's `UISplitViewController`, but, instead, relies on defining the structure of the `NavigationView` and having the system handle the "splitting" depending on the layout of the device.


## Using alert() and sheet() with optionals

Sometimes we want to show an alert or sheet if a Boolean value is true. Sometimes we want to show it if a value exists altogether. (Side note: This is why Optionals can be useful in general 🙂).

Thankfully, SwiftUI gives us a version of the `alert` or `sheet` modifiers that can bind to the existence of an `Identifiable` Optional. Much more useful than driving a Boolean with side-effects 💪.
