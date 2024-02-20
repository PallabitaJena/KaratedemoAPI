// jsExecutor.js
var evalCode = function(jsCode) {
    var context = new (Java.type('org.graalvm.polyglot.Context'))();
    context.eval('js', jsCode);
    return context;
};

evalCode(jsCode);
