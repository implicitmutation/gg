{ pkgs, ... }: {

  # Which nixpkgs channel to use.
  channel = "stable-24.05";  # or "unstable"

  # Use https://search.nixos.org/packages to find packages
  packages = [
    pkgs.nodejs
    pkgs.go
    pkgs.util-linux
  ];

  # Sets environment variables in the workspace
  env = {
    # You can get a Gemini API key through the IDX Integrations panel to the left!
    GOOGLE_API_KEY = "<your-api-key>";
  };

  # Enable previews and customize configuration
  idx.previews = {
    enable = true;
    previews = [
      {
        command = [
          "npx"
          "genkit"
          "start"
          "--port"
          "$PORT"
        ];
        manager = "web";
        id = "web";
      }
    ];
  };

  idx.workspace = {
    onCreate = {
      tos = ''
        mkdir -p "$HOME/.config/configstore/@genkit-ai" && echo '{"analytics_notification":true,"genkit-tools-ga-id":"'"$(uuidgen)'"'}' > "$HOME/.config/configstore/@genkit-ai/tools-common.json"
      '';
    };
  };
}
