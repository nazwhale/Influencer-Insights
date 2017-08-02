# Influencer Insights
[![Build Status](https://travis-ci.org/nazwhale/PTT.svg?branch=master)](https://travis-ci.org/nazwhale/PTT)
[![Coverage Status](https://coveralls.io/repos/github/nazwhale/PTT/badge.svg?branch=master)](https://coveralls.io/github/nazwhale/PTT?branch=master)

This program gives a small selection of insights when given a JSON file of YouTube influencer data:

- The title of the video with the highest percentage of likes-to-dislikes
- The average (mean) percentage of likes-to-dislikes
- The total number of views

### Installation
Clone repository:

```
$ git clone git@github.com:nazwhale/PTT.git
$ cd PTT
```
Install dependencies with [Bundler](http://bundler.io/):
```
$ gem install bundler     
$ bundle install
```

### Use

In the terminal, simply run `ruby enlighten_me.rb` and specify the JSON information file of the influencer you wish to learn more about as an argument.

Let's test it on some data from [Zoella's](https://www.youtube.com/user/zoella280390?gl=GB&hl=en-GB) channel...

```
$ ruby enlighten_me.rb zoella_video_stats.json
/====================================================/
  Influencer Insights for Zoella:

    Video with the highest % likes-to-dislikes:
      Most Likely To : Tanya Edition

    Average likes-to-dislikes:
      99.0

    Total video views:
      14125776
/====================================================/
```
