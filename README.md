# JSON Analyser
[![Build Status](https://travis-ci.org/nazwhale/PTT.svg?branch=master)](https://travis-ci.org/nazwhale/PTT)
[![Coverage Status](https://coveralls.io/repos/github/nazwhale/PTT/badge.svg?branch=master)](https://coveralls.io/github/nazwhale/PTT?branch=master)

A JSON parser for YouTube video analytics.

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

In the terminal, simply run `ruby enlighten_me.rb` and specify the JSON information file of the influencer you wish to learn more about.

For example:

```
$ ruby enlighten_me.rb zoella_video_stats.json
/====================================================/
  Influencer Insights for Zoella:

    Video with the highest % likes-to-dislikes:
      Most Likely To : Tanya Edition

    Average likes-to-dislikes:
      99.00276583669357

    Total video views:
      14125776
/====================================================/
```
