{
  description = "A very basic flake";

  outputs = {
    self,
    nixpkgs,
  }: {
    devShell.x86_64-linux = let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in
      pkgs.mkShell {
        buildInputs = [
          pkgs.python310Full
          pkgs.python311Packages.pip
          pkgs.pandoc
          pkgs.portaudio
        ];
        shellHook = ''
          python -m venv .venv

          source ./.venv/bin/activate
          export LD_LIBRARY_PATH=$(nix eval --raw nixpkgs#zlib)/lib:$LD_LIBRARY_PATH
          export LD_LIBRARY_PATH=$(nix eval --raw nixpkgs#stdenv.cc.cc.lib)/lib:$LD_LIBRARY_PATH
          export LD_LIBRARY_PATH=$(nix eval --raw nixpkgs#portaudio)/lib:$LD_LIBRARY_PATH

          pip install -U whisper-ctranslate2

        '';
      };
  };
}
