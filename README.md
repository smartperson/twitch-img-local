# twitch-img-local
Easy camera upload from mobile to local computer; optimized for displaying in OBS web frame.

## Why?
As I'm starting to stream on Twitch I want to make the stream dynamic. I don't stream games, but rather software/hardware development.
Specifically I wanted to be able to take a picture with my phone camera and have it show up in OBS. I'm running it at https://twitch.tv/smartperson

## What?
A simple Sinatra application. Any time you take a picture on your phone through this app, the web view will update to show you the newest image taken.

## How?

1. Run `ruby app.rb`
2. Point an OBS web view to http://localhost:4567/latest.
3. View http://your-computer:4567/ on your mobile device.
4. Upload camera image using webform.
