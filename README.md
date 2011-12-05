
mm_uses_no_id plugin
============

Embedded models that use this plugin don't have an id field by default. This can save on storage space if the id isn't needed.

Requirements
============

- MongoMapper 0.10.1 or greater

Installation
=======

Add this to your Gemfile if using Bundler: `gem 'mm_uses_no_id'`

Or install the gem from the command line: `gem install mm_uses_no_id`

Usage
=======

Use the MongoMapper `plugin` method to add MmUsesNoId to your model, for example:

```
class Person
  include MongoMapper::EmbeddedDocument
  plugin  MmUsesNoId
  
  key :name, String
end
```

Copyright (c) 2011 PeepAll Ltd, released under the MIT license
