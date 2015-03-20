component output = 'false' accessors = 'true' {

  public any function init() {
    this.newRelic = createObject("java", "com.newrelic.api.agent.NewRelic");
    return this;
	}

  public boolean function setRequest (
      string applicationName
    ) {
    try {
      getPageContext().getRequest().getOriginalRequest().setAttribute("com.newrelic.agent.APPLICATION_NAME", arguments.applicationName);
      this.newRelic.setTransactionName(nullValue(), cgi.script_name & cgi.path_info);
      this.newRelic.addCustomParameter("session_id", session.sessionid);
    } catch (e) {
      return false;
    }
    return true;
  }

  public boolean function logError(
      struct exception
    ) {
    try {
      var cause = arguments.exception.getRootCause();
      this.newRelic.addCustomParameter("Line Number", arguments.exception.TagContext[1].line);
      this.newRelic.addCustomParameter("Template File", arguments.exception.TagContext[1].template);
      this.newRelic.addCustomParameter("Code Snippet", arguments.exception.TagContext[1].codePrintPlain);
      var params = {  
                      error_id =  createUUID(), 
                      type: arguments.exception.type ?: 'unknown.error',
                      message: arguments.exception.message ?: '',
                   };
      this.newRelic.noticeError(cause, params);
    } catch(e) {
      return false;
    }
    return true;
	}

}