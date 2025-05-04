{ nixpkgs }:
{
  nvim =
    { ... }:
    {
      settings = {
        wrapRc = false;
      };
      categories = {
        debug = true;
        general = true;
        lang = true;
        theme = true;
        tools = true;
        testing = true;
      };
      extra = {
        nixdExtras = { inherit nixpkgs; };
      };
    };
}
