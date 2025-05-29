# ViaExit

**ViaExit** is a tiny CGI routing library for the Ada programming language.  
It lets you build HTTP services the old way — process-per-request, stdin and stdout — and it still works beautifully.

CGI is not dead. For simple deployments, sandboxing, and script-style development, it remains a valid and surprisingly robust option.

ViaExit brings Ada’s safety and structure to this classic model.

---

## Features

- 📜 Simple route registration
- 🔍 Automatic dispatch based on `PATH_INFO`
- 🧾 Handler access to HTTP input (method, query, form data, headers)
- 📤 Return structured responses (headers + body)
- 🛠 No long-running server: works with any CGI-supporting web server

---

## Example

```ada
with Via_Exit;

procedure Main is
begin
   Via_Exit.Register ("/hello", Hello_Handler'Access);
   Via_Exit.Register ("/echo", Echo_Handler'Access);
   Via_Exit.Run;
end Main;
```

Each handler gets the request and returns a response:

```ada
function Hello_Handler (Req : Via_Exit.Request) return Via_Exit.Response is
begin
   return Via_Exit.Html ("<h1>Hello, world!</h1>");
end;
```

## Why CGI?

- 🔐 Each request is isolated in its own process
- 🌐 Supported by all major web servers
- 🐚 Plays well with Unix pipelines and scripts
- 🚫 No need to run a long-lived server process

For small self-hosted apps, legacy support, or static-site enhancements, CGI is still a viable backend architecture.
