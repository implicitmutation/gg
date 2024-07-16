/*
rm -rf ./test && \
idx-template \
  /home/user/gg/template \
  --output-dir /home/user/gg/test -a '{ "language": "go", "tos": "true" }'
*/
{pkgs, language ? "js", tos ? "false", ... }: {  
  packages = [
    pkgs.nodejs
    pkgs.go
  ];
  bootstrap = ''
    mkdir "$out"
    mkdir "$out"/.idx
    cp ${./dev.notos.nix} "$out"/.idx/dev.nix
    cp ${./README.md} "$out"/README.md
    ${if language == "go" then "env -C \"$out\" go mod init genkit" else "" }
    env -C "$out" npm i -D genkit
    env -C "$out" npx genkit init --non-interactive -p other -m googleai
    chmod -R u+w "$out"
  '';
}
