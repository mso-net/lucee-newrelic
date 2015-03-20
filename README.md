# Lucee New Relic Component

A [Lucee](http://lucee.org) component to pass request and error data to the [New Relic APM](http://newrelic.com/).

## Usage

The component is very simple to use and only contains two functions, one to pass a request and the other to pass errors. These functions should be called from inside the Application.cfc as shown in the example Application.cfc included.

## Additional Settings
There is one additional setting you might want to change with New Relic to get more details in the database queries. By default New Relic obfuscates the queries removing the data that is passed in them. To change this setting open the `newrelic.yml` configuration file in the newrelic directory and change the following setting:

from: `record_sql: obfuscated`
to: `record_sql: raw`

## Thanks.
Thanks to [Sean Corfield](http://corfield.org/) and [Chris Blackwell](https://twitter.com/d1rtym0nk3y) for giving me some pointers and code samples.