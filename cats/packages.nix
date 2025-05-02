{ nixpkgs }:
{
  nvim =
    { name, ... }:
    {
      settings = {
        configDirName = name;
      };
      categories = {
        debug = true;
        general = true;
        lang = true;
        theme = true;
        tools = true;
      };
      extra = {
        nixdExtras = { inherit nixpkgs; };
      };
    };
}
