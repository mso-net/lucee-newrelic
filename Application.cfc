component {

  this.name = cgi.server_name;
  this.applicationTimeout = CreateTimeSpan(0,2,0,0);
  this.sessionManagement = true;
  this.sessionTimeout = CreateTimeSpan(0,1,0,0);

  function onApplicationStart() {
    application.newRelic = new newrelic.newrelic();
    return true;
  }

  function onRequest( string targetPage ) {
    application.newRelic.setRequest(this.name);
    include arguments.targetPage;
  }

  function onError( any Exception, string EventName ) {
    application.newRelic.logError(arguments.Exception);
  }

}