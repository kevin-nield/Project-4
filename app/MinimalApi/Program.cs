var builder = WebApplication.CreateBuilder(args);
builder.Services.AddHealthChecks();
var app = builder.Build();

app.MapHealthChecks("/health");

app.MapGet("/config", (IConfiguration config) =>
{
    var env = config["MyApp:EnvironmentName"];
    var message = config["MyApp:Message"];

    return Results.Ok(new {env, message });
});

app.Run();
